const Router = require('express')
const router = new Router()
const authMiddleware = require('../middleware/auth.middleware')
const fileController = require('../controllers/fileController')


router.get('', authMiddleware, fileController.getFiles)
router.post('', authMiddleware, fileController.createDir)
router.post('/upload', authMiddleware, fileController.uploadFile)
router.get('/download', authMiddleware, fileController.downloadFile)
router.get('/file', authMiddleware, fileController.getFile)
router.delete('/', authMiddleware, fileController.deleteFile)
router.get('/search', authMiddleware, fileController.searchFile)
router.get('/file/:token', fileController.getFileInfoByLink)
router.get('/file/download/:token', fileController.downloadFileByToken)
// router.post('/file/:link', fileController.downloadFileByToken)
// router.get('/file/:link', fileController.downloadFileByToken)



module.exports = router