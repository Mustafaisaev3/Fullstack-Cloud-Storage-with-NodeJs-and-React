const jwt = require('jsonwebtoken')
const config = require('config')


module.exports = (req, res, next) => {
    if (req.method === 'OPTIONS') {
        return next()
    }
    console.log(req.headers.authorization)
    try {
        const token = req.headers.authorization.split(' ')[1]
        if (!token) {
            return res.status(401).json({message: 'Auth error'})
        }

        const decoded = jwt.verify(token, config.get('secretKey'))
        console.log(decoded, 'token', token)
        req.user = decoded
        next()
    } catch (error) {
        return res.status(401).json({message: 'Auth errorrr'})
    }
}