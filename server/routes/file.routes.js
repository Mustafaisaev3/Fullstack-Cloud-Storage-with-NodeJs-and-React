const Router = require('express')
const router = new Router()
const authMiddleware = require('../middleware/auth.middleware')
const fileController = require('../controllers/fileController')


router.get('', authMiddleware, fileController.getFiles)
router.post('', authMiddleware, fileController.createDir)
router.post('/upload', authMiddleware, fileController.uploadFile)
router.get('/file', authMiddleware, fileController.getFile)



module.exports = router