const Router = require('express')
const config = require('config')
const User = require('../models/User')
const bcrypt = require('bcryptjs')
const {check, validationResult} = require('express-validator')
const jwt = require('jsonwebtoken')

const router = new Router()

router.post('/registration', async (req, res) => {
    
    [
        check('email', 'Uncorrect email').isEmail(),
        check('password', 'Password must be longer than 3 and shorter than 12').isLength({min: 3, max: 12})
    ]

    try {

        const errors = validationResult(req)

        if(!errors.isEmpty()){
            res.status(400).json({message: 'Uncorrect request', errors})
        }

        const { email, password } = req.body

        const candidate = await User.findOne({email})

        if(candidate){
            res.status(400).json({message: `User with email ${email} alrady exist`})
        }

        const hashPassword = await bcrypt.hash(password, 8)
        const user = new User({email, password: hashPassword})

        await user.save()
        return res.json({message: 'user was created'})
        
    } catch (error) {
        console.log(error)
        res.send({'message': 'server error'})
    }
})

router.post('/login', async (req, res) => {
    
    try {
        
        const {email, password} = req.body

        const user = await User.findOne({email})

        if(!user){
            return res.status(404).json({message: 'User not found'})
        }

        const isValidPassword = bcrypt.compareSync(password, user.password)

        if(!isValidPassword){
            return res.status(400).json({message: "Password is incorrect"})
        }

        const token = jwt.sign({id: user.id}, config.get('secretKey'), {expiresIn: '1h'})

        return res.json({
            token,
            user: {
                id: user.id,
                email: user.email,
                diskSpace: user.diskSpace,
                usedSpace: user.usedSpace,
                avatar: user.avatar
            }
        })

    } catch (error) {
        console.log(error)
        res.send({'message': 'server error'})
    }
})

module.exports = router