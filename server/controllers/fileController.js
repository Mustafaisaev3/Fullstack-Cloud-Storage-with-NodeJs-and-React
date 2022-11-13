const fileService = require('../services/fileService')
const User = require('../models/User')
const File = require('../models/File')


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

}

module.exports = new FileController()