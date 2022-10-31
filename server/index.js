const express = require('express')
const mongoose = require('mongoose')
const config = require('config')
const cors = require('./middleware/cors.middleware')

const authRouter = require('./routes/auth.routes')

const app = express()
const PORT = config.get('serverPort')

app.use(cors)
app.use(express.json())
app.use('/api/auth', authRouter)

const start = async () => {
    try {

        await mongoose.connect('mongodb://localhost:27017/Cloud_Storage')

        app.listen(PORT, () => {
            console.log('server runned on port - ', PORT)
        })
    } catch (error) {
        
    }
}

start()