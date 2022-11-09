const express = require('express')
const mongoose = require('mongoose')
const config = require('config')
const cors = require('./middleware/cors.middleware')
// const corsMiddleware = require('./middleware/cors.middleware')
// var cors = require('cors')

const authRouter = require('./routes/auth.routes')
const fileRouter = require('./routes/file.routes')

const app = express()
const PORT = config.get('serverPort')

app.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Methods", "GET, PUT, PATCH, POST, DELETE");
    res.header("Access-Control-Allow-Headers", "Content-Type, Authorization, Origin, X-Requested-With, Accept");
    next();
})
app.use(express.json())
app.use('/api/auth', authRouter)
app.use('/api/files', fileRouter)

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