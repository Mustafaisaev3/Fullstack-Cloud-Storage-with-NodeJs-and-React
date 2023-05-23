const express = require('express')
const mongoose = require('mongoose')
const config = require('config')
const fileuploader = require('express-fileupload')
const http = require('http')
const ws = require('ws')
const cors = require('./middleware/cors.middleware')
const jwt = require('jsonwebtoken')
const User = require('./models/User')
const Message = require('./models/Chat/Messages')
const Conversation = require('./models/Chat/Conversation')
// const corsMiddleware = require('./middleware/cors.middleware')
// var cors = require('cors')
const cookieParser = require('cookie-parser');
const socketIo = require('socket.io');

const authRouter = require('./routes/auth.routes')
const fileRouter = require('./routes/file.routes')
const chatRouter = require('./routes/chat.routes')


const app = express();
const server = http.createServer(app);
const wss = socketIo(server, {
    cors: {
      origin: "*",
      allowedHeaders: ["cookie"],
      credentials: true
    }
});

const PORT = config.get('serverPort')

app.use(cookieParser());
app.use(fileuploader({}))
app.use((req, res, next) => {
    // res.header("Access-Control-Allow-Origin", "*");
    res.header('Access-Control-Allow-Credentials', true);
    res.header('Access-Control-Allow-Origin', req.headers.origin);
    res.header("Access-Control-Allow-Methods", "GET, PUT, PATCH, POST, DELETE");
    res.header("Access-Control-Allow-Headers", "Content-Type, Authorization, Origin, X-Requested-With, Accept");
    next();
})

app.use(express.json())
app.use('/api/auth', authRouter)
app.use('/api/files', fileRouter)
app.use('/api/chat', chatRouter)


mongoose.connect('mongodb://localhost:27017/Cloud_Storage')

// const wss = new ws.WebSocketServer({server})

// Websocket work
let users = []

const addUser = (userId, socketId) => {
    !users.some((user) => user.userId === userId) && users.push({userId, socketId})
}

const removeUser = (socketId) => {
    users = users.filter((user) => user.socketId !== socketId )
}

console.log(users)

wss.on('connection', (socket) => {
    console.log('user connected')
    socket.on('addUser', (userId) => {
        addUser(userId, socket.id)
        wss.emit('getUsers', users)
    })
    
    //send and get message
    socket.on("sendMessage", ({conversationId, sender, receiver, text}) => {
        const targetReceiver = users.find(user => user.userId == receiver);
        // wss.emit('getUsers', users)
        console.log(users, receiver)
        wss.to(targetReceiver.socketId).emit("getMessage", {
            conversationId,
            sender,
            text,
        });

    });

    socket.on('disconnect', () => {
        console.log('user disconected')
        removeUser(socket.id)
        wss.emit('getUsers', users)
    })
})

server.listen(PORT, () => {
    console.log('server runned on port - ', PORT)
})

// wss.on('connection', (connection) => {
//     const cookies = connection.request.headers.cookie

//     console.log('connect')
//     if(cookies) {
//         const tokenCookieString = cookies.split(';').find(str => str.startsWith('cloud_token='))
//         if(tokenCookieString) {
//             const token = tokenCookieString.split('=')[1]
//             if(token) {
//                 jwt.verify(token, config.get('secretKey'), {}, (err,data) => {
//                     if(err) throw err
//                     connection.userId = data.id
//                     connection.username = data.email
//                 })
//             }
//         }
//     }

//     connection.on('message', async (message) => {
//         const {recipient, text, conversationId} = JSON.parse(message.toString())
//         console.log(recipient, text)
//         if (recipient && text) {
//             if (conversationId) {
//                 const targetConversation = await Conversation.findOne({_id: conversationId})
//                 const newMessage = await Message.create({
//                     sender: connection.userId,
//                     recipient: recipient.userId,
//                     text
//                 });

//                 targetConversation.messages.push(newMessage._id)
//             } else if (!conversationId) {
//                 const newConversation = await Conversation.create({users: [connection.userId, recipient.userId]})
//                 const newMessage = await Message.create({
//                     sender: connection.userId,
//                     recipient: recipient.userId,
//                     text
//                 });

//                 newConversation.messages.push(newMessage._id)
//             }
//             const newMessage = await Message.create({
//                 sender: connection.userId,
//                 recipient: recipient.userId,
//                 text
//             });

//             [...wss.clients].filter(c => c.userId === recipient).forEach(c => c.send(JSON.stringify({text, sender: connection.userId, _id: newMessage._id})))
//         }
//     }),

//     connection.on('hello', (data) => {
//         console.log('hello')
//     }),


//     [...wss.clients].forEach(client => {
//         client.send(JSON.stringify({
//             online: [...wss.clients].map(c => ({userId: c.userId, username: c.username}))
//             }
//         ))
//     })
// })


