const fileService = require('../services/fileService')
const User = require('../models/User')
const File = require('../models/File')
const config = require('config')
const fs = require('fs')


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
            // console.log(error)
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
            // console.log('sgsgsgsgsgssgsgg',files,'shshshsshsssshshhshs')
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
            const dbFile = new File({
                name: file.name,
                type,
                size: file.size,
                path: parent?.path,
                parent: parent?._id,
                user: user._id
            })

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
            const path = `${config.get('filePath')}\\${req.user.id}\\${file.path}\\${file.name}`

            if(fs.existsSync(path)){
                return res.download(path, file.name)
            }

            return res.status(400).json({message: "File not found"})
        } catch (error) {
            return res.status(500).json({message: "Download error"})
        }
    }

}

module.exports = new FileController()