// const fileService = require('../services/fileService')
// const User = require('../models/User')
// const Conversation = require('../models/Conversation')
// const config = require('config')
// const fs = require('fs')
// const Message = require('../models/Message')


// class ChatController {
//     // async getUsers (req, res) {
//     //     try {
//     //         const {name, type, parent} = req.body
//     //         const file = new File({name, type, parent, user: req.user.id})

//     //         const parentFile = await File.findOne({_id: parent})

//     //         if (!parentFile) {
//     //             file.path = name
//     //             await fileService.createDir(file)
//     //         } else {
//     //             file.path = `${parentFile.path}\\${file.name}`
//     //             await fileService.createDir(file)
//     //             parentFile.childs.push(file._id)
//     //             await parentFile.save()
//     //         }

//     //         await file.save()
//     //         return res.json(file)

//     //     } catch (error) {
//     //         return res.status(400).json(error)
//     //     }
//     // }

//     async getUsers (req, res) {

//         try {
//             const users = await User.find()
//             return res.json(users)

//         } catch (error) {
//             return res.status(500).json({message: "Can not get users"})
//         }

//     }

//     async getConversations (req, res) {
//         try {
            
//             const userId = req.body.userId
//             const conversationsModal = await Conversation.find({
//                 users: {
//                     $all: [userId]
//                 }
//             })

//             // const conversations = conversationsModal.map(item => {
//             //     let messages = []
//             //     item.messages.map(async message => {
//             //        let m = await Message.find({_id: message._id})
//             //        messages.push(m[0])
//             //     })
//             //     console.log(messages)
//             //     item.messages = messages
//             // })
//             // console.log(conversations)
//             return res.status(200).json(conversationsModal)

//         } catch (error) {
//             return res.status(500).json({message: "Can not find conversations"})
//         }
//     }

//     async getMessages (req, res) {
//         try {
//             const {user1, user2} = req.body
//             // const conversation = await Conversation.find({_id: conversationId}).populate('users').populate('messages')
//             const conversation = await Message.find({
//                 users: {
//                     $all: [userId]
//                 }
//             })

//             const func = async (messages) => {
//                 let messagesObj = []
//                 for (const _id of messages){
//                     const message = await Message.find({_id}).populate('from').populate('to')
//                     messagesObj.push(...message)
//                 }
//                 console.log(messagesObj)
//                 return res.status(200).json({messages: messagesObj})
//             }
            
//             func(conversation[0].messages)
//             // console.log(conversation[0].messages)
//             // return res.status(200).json({messages: conversation[0].messages})
//         } catch (error) {
//             return res.status(500).json({message: "Messages not found"})
//         }
//     }

//     async createMessage (req, res) {

//         try {
//             const {from, to, message} = req.body
//             const newMessage = new Message({
//                 message,
//                 from,
//                 to
//             })
//             await newMessage.save()

//             return res.status(200).json({message: "Message created successful!"})

//         } catch (error) {
//             return res.status(500).json({message: "Can not get users"})
//         }

//     }
// }

// module.exports = new ChatController()














const fileService = require('../services/fileService')
const User = require('../models/User')
const Conversation = require('../models/Conversation')
const config = require('config')
const fs = require('fs')
const Message = require('../models/Message')
const File = require('../models/File')


class ChatController {

    async getUsers (req, res) {

        try {
            const users = await User.find()
            return res.json(users)

        } catch (error) {
            return res.status(500).json({message: "Can not get users"})
        }

    }

    async getConversations (req, res) {
        try {
            
            const userId = req.query.userId
            console.log(userId)
            const conversationsModal = await Conversation.find({
                users: {
                    $all: [userId]
                }
            }).populate('users')

            // const conversations = conversationsModal.map(item => {
            //     let messages = []
            //     item.messages.map(async message => {
            //        let m = await Message.find({_id: message._id})
            //        messages.push(m[0])
            //     })
            //     console.log(messages)
            //     item.messages = messages
            // })
            // console.log(conversations)
            console.log(conversationsModal)
            return res.status(200).json(conversationsModal)

        } catch (error) {
            return res.status(500).json({message: "Can not find conversations"})
        }
    }

    async getConversation (req, res) {
        try {
            
            // const userId = req.query.userId
            const conversationId = req.query.conversationId
            // console.log(conversationId)
            const conversation = await Conversation.find({ _id: conversationId }).populate('users').populate('messages')

            // const conversations = conversationsModal.map(item => {
            //     let messages = []
            //     item.messages.map(async message => {
            //        let m = await Message.find({_id: message._id})
            //        messages.push(m[0])
            //     })
            //     console.log(messages)
            //     item.messages = messages
            // })
            // console.log(conversations)
            // console.log(conversation)
            return res.status(200).json(conversation[0])

        } catch (error) {
            return res.status(500).json({message: "Can not find conversation"})
        }
    }

    async getMessages (req, res) {
        try {
            const { conversationId } = req.query
            const conversation = await Conversation.find({_id: conversationId}).populate('users').populate('messages')

            const populateMessages = async (messages) => {
                let messagesObj = []
                for (const _id of messages){
                    const message = await Message.find({_id}).populate('from').populate('to').populate('files')
                    messagesObj.push(...message)
                }
                
                console.log(messagesObj)
                return messagesObj
            }

            const responseMessages = async () => {
                const messages = await populateMessages(conversation[0].messages)
                console.log(messages)
                const newMessageObj = messages.map((msg) => {
                    return {
                        // myself: msg.from._id.toString() === userId,
                        message: msg
                    }
                })
                return res.status(200).json({status: 'success', messages: newMessageObj})
            }

            responseMessages()

        } catch (error) {
            return res.status(500).json({message: "Messages not found"})
        }
    }

    async createMessage (req, res) {

        try {
            const {from, to, message, conversationId} = req.body
            const user = await User.findOne({_id: from})

            const postFiles = [...req.files.files]

            
            const setMessagesInFile = async () => {
                const newMessage = new Message({
                    message,
                    from,
                    to,
                    files: []
                })
                
                postFiles.forEach(async file => {
                    let path = `${config.get('filePath')}\\${user._id}\\shared\\${file.name}`
    
                    if (fs.existsSync(path)){
                        // return res.status(400).json({message: "File qlready exist"})
                    }
    
                    file.mv(path)
        
                    const type = file.name.split('.').pop()
        
                    let filePath = `shared\\${file.name}` 
    
                    const dbFile = new File({
                        name: file.name,
                        type,
                        size: file.size,
                        path: filePath,
                        parent: undefined,
                        user: user._id
                    })
    
                    newMessage.files.push(dbFile._id)
                    await dbFile.save()
                })
    
                await newMessage.save()
                return newMessage
            }

            const setMessageToConversation = async (message) => {
                console.log(conversationId === null)
                if (!conversationId){
                    const conversation = await Conversation.findOne({_id: conversationId})
                    conversation.messages.push(message._id)
                    await conversation.save()
                    const conv = await conversation.populate('messages')
                    return res.json({status:'success', message: message, conversation: conv})
                } else {
                    const newConversation = new Conversation({
                        messages: [message._id],
                        users: [from, to]
                    })
    
                    await newConversation.save()
                    return res.json(newConversation)
                }
            }

            const createMsg = async () => {
                const msg = await setMessagesInFile()
                console.log(msg)
                setMessageToConversation(msg)
            }

            createMsg()


        } catch (error) {
            return res.status(500).json({message: "Can not get messages"})
        }

    }
}

module.exports = new ChatController()

























// async getMessages (req, res) {
//     try {
//         const {conversationId, userId} = req.query
//         const conversation = await Conversation.find({_id: conversationId}).populate('users').populate('messages').populate('files')

//         const func = async (messages) => {
//             let messagesObj = []
//             for (const _id of messages){
//                 const message = await Message.find({_id}).populate('from')
//                 messagesObj.push(...message)
//                 console.log(message,'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj')
//             }
//             const newMessageObj = messagesObj.map((msg) => {
//                 return {
//                     myself: msg.from._id.toString() === userId,
//                     message: msg
//                 }
//             })
//             console.log(newMessageObj)
//             return res.status(200).json({messages: newMessageObj})
//         }
        
//         func(conversation[0].messages)
//     } catch (error) {
//         return res.status(500).json({message: "Messages not found"})
//     }
// }
