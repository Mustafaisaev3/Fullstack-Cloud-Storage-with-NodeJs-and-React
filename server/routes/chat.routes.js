const Router = require('express')
const chatController = require('../controllers/chatController')

const router = new Router()

router.get('/', chatController.getUsers)
router.get('/conversations', chatController.getConversations)
router.get('/conversation', chatController.getConversation)
router.post('/setMessage', chatController.createMessage)
router.get('/messages', chatController.getMessages)

module.exports = router