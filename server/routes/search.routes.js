const Router = require('express')
const router = new Router()
const authMiddleware = require('../middleware/auth.middleware')
const searchController = require('../controllers/searchController')


router.post('', authMiddleware, searchController.search)



module.exports = router