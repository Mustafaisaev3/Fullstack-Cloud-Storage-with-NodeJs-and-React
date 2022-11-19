const fs = require('fs')
const File = require('../models/File')
const config = require('config')


class FileService {

    createDir (file) {
        const filePath = `${config.get('filePath')}\\${file.user}\\${file.path}`

        return new Promise((resolve, reject) => {
            try {
                if (!fs.existsSync(filePath)){
                    fs.mkdirSync(filePath)
                    return resolve({message: 'File was created'})
                } else {
                    return resolve({message: 'File already exist'})
                }


            } catch (error) {
                return reject({message: 'File error'})
            }
        })
    }

    deleteFile (file) {
        const path = this.getPath(file)
        console.log(path)
        if(file.type === 'dir'){
            fs.rmdirSync(path)
        } else {
            fs.unlinkSync(path)
        }
    }

    getPath (file) {
        console.log(file.path)
        return config.get('filePath') + '\\' + file.user + '\\' + file.path
        // return config.get('filePath') + '\\' + file.user + '\\' + file.path + '\\' + file.name
    }

}


module.exports = new FileService()