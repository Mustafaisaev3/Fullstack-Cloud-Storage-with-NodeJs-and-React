const Router = require('express')
const chatController = require('../controllers/chatController')

const router = new Router()

// router.get('/users', chatController.getUsers)
// router.post('/search-user', chatController.searchUser)
router.post('/', chatController.createConversation)
router.post('/online-users', chatController.getOnlineUsers)
router.get('/:userId', chatController.getUserConversation)
router.post('/message', chatController.createMessage)
router.get('/messages/:conversationId', chatController.getMessages)



// router.get('/', chatController.getUsers)
// router.get('/conversations', chatController.getConversations)
// router.get('/conversation', chatController.getConversation)
// router.post('/setMessage', chatController.createMessage)
// router.get('/messages', chatController.getMessages)

module.exports = router