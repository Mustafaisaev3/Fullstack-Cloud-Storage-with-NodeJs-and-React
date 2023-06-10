const fileService = require('../services/fileService')
const User = require('../models/User')
const File = require('../models/File')
const config = require('config')
const fs = require('fs')
const jwt = require('jsonwebtoken')


class FileController {
    async createDir (req, res) {
        try {
            const {name, type, parent} = req.body
            const file = new File({name, type, parent, user: req.user.id})

            const parentFile = await File.findOne({_id: parent})

            if (!parentFile) {
                file.path = name
                await fileService.createDir(file)
            } else {
                file.path = `${parentFile.path}\\${file.name}`
                await fileService.createDir(file)
                parentFile.childs.push(file._id)
                await parentFile.save()
            }

            await file.save()
            return res.json(file)

        } catch (error) {
            return res.status(400).json(error)
        }
    }

    async getFiles (req, res) {

        try {
            let files = undefined
            if (req.query.parent) {
                files = await File.find({user: req.user.id, parent: req.query.parent})
            } else {
                files = await File.find({user: req.user.id})
            }
            console.log('sgsgsgsgsgssgsgg',files,'shshshsshsssshshhshs')
            return res.json(files)

        } catch (error) {
            // console.log(error)
            return res.status(500).json({message: "Can not get files"})
        }

    }

    async getFile (req, res) {

        try {
            const { id } = req.body
            const file = await File.find({_id: id})

            console.log(file,'shshshsshs')
            return res.json(file)

        } catch (error) {
            // console.log(error)
            return res.status(500).json({message: "Can not find file"})
        }

    }

    async uploadFile (req, res) {
        try {
            const file = req.files.file
     
            const parent = await File.findOne({user: req.user.id, _id: req.body.parent})
            const user= await User.findOne({_id: req.user.id})

            if(user.usedSpace + file.size < user.diskSpace){
                return res.status(400).json({message: "No space on the disk"})
            }

            user.usedSpace = user.usedSpace + file.size

            let path

            if (parent) {
                path = `${config.get('filePath')}\\${user.id}\\${parent.path}\\${file.name}`
            } else {
                path = `${config.get('filePath')}\\${user.id}\\${file.name}`
            }

            if (fs.existsSync(path)){
                return res.status(400).json({message: "File qlready exist"})
            }

            file.mv(path)

            const type = file.name.split('.').pop()

            let filePath = file.name
            if(parent){
                filePath = parent.path + '\\' + file.name
            }
            const dbFile = new File({
                name: file.name,
                type,
                size: file.size,
                path: filePath,
                parent: parent?._id,
                user: user._id
            })

            const fileObjForJwt = {
                file_id: dbFile._id,
                user_id: user._id
            }

            // const fileDownloadToken = `http://localhost:5000/api/files/file/${jwt.sign(fileObjForJwt, config.get('secretKey'))}`
            const fileDownloadToken = jwt.sign(fileObjForJwt, config.get('secretKey'))

            dbFile.downloadToken = fileDownloadToken

            await dbFile.save()
            await user.save()

            res.json(dbFile)

        } catch (error) {
            return res.status(500).json({message: "Can not find file"})
        }
    }

    async downloadFile (req, res) {
        try { 
            const file = await File.findOne({_id: req.query.id, user: req.user.id})
            // const path = `${config.get('filePath')}\\${req.user.id}\\${file.path}\\${file.name}`
            const path = `${config.get('filePath')}\\${req.user.id}\\${file.path}`
            console.log(file, path)
            if(fs.existsSync(path)){
                return res.download(path, file.name)
            }

            return res.status(400).json({message: "File not found"})
        } catch (error) {
            return res.status(500).json({message: "Download error"})
        }
    }

    async getFileInfoByLink (req, res) {
        try { 
            const { token } = req.params

            console.log(token)

            const decoded = jwt.verify(token, config.get('secretKey'))

            const file = await File.findOne({_id: decoded.file_id, user: decoded.user_id})

            if (!file) {
                return res.status(400).json({message: "File not found"})
            }


            return res.status(200).json({status: 'success', data: file})
        } catch (error) {
            return res.status(500).json({status: 'error',message: error})
        }
    }

    async downloadFileByToken (req, res) {
        try { 
            const { token } = req.params

            console.log(token)

            const decoded = jwt.verify(token, config.get('secretKey'))

            const file = await File.findOne({_id: decoded.file_id, user: decoded.user_id})

            if (!file) {
                return res.status(400).json({message: "File not found"})
            }

            const path = `${config.get('filePath')}\\${decoded.user_id}\\${file.path}`
            console.log(file, path)
            if(fs.existsSync(path)){
                return res.download(path, file.name)
            }

            return res.status(400).json({message: "File not found"})
        } catch (error) {
            return res.status(500).json({message: "Download error"})
        }
    }

    async deleteFile (req, res) {
        try {
            
            const file = await File.findOne({_id: req.query.id, user: req.user.id})

            if(!file){
                return res.status(400).json({message: "File not found"})
            }

            fileService.deleteFile(file)

            await file.remove()
            return res.json({message: "File was deleted"})
        } catch (error) {
            console.log(error)
        }
    }

    async searchFile (req, res) {
        try {
            const searchWord = req.query.search
            console.log(searchWord)
            let files = await File.find({user: req.user.id})

            files = files.filter(file => file.name.includes(searchWord))

            return res.json(files)
            
        } catch (error) {
            console.log(error)
        }
    }

}

module.exports = new FileController()
