const Conversation = require('../models/Chat/Conversation')
const Message = require('../models/Chat/Messages')
const User = require('../models/User')

class ChatController {
    // async getUsers (req, res) {
    //     try {
    //         const users = await UserModel.find({})

    //         return res.status(200).json({status: 'success', users})
    //     } catch (error) {
    //         res.status(400).json({error})
    //     }
    // }

    // async searchUser (req, res) {
    //     try {
    //         const searchStr = req.query.search.trim()
    //         const search = await User.find({email: {$regex: new RegExp('^'+searchStr+'.*','i')}}).exec()
    //         search = search.slice(0,10)
    //         return res.status(200).json({status: 'success', search})
    //     } catch (error) {
    //         res.status(400).json({error})
    //     }
    // }

    async createConversation (req, res) {
        try {
            const {senderId, receiverId} = req.body
            const newConversation = await Conversation.create({members: [senderId, receiverId]})

            return res.status(200).json({status: 'success', data: newConversation})
        } catch (error) {
            res.status(400).json({error})
        }
    }

    async getUserConversation (req, res) {
        try {
            const { userId } = req.params
            const conversation = await Conversation.find({
                members: { $in: [userId] },
            }).populate({
                path: 'members',
                model: User
            });

            return res.status(200).json({status: 'success', data: conversation})
        } catch (error) {
            res.status(400).json({status: 'error', message: error.message})
        }
    }

    async createMessage (req, res) {
        try {
            const {sender, receiver, text, conversationId} = req.body

            console.log(req.body)

            if (conversationId) {
                const newMessage = await Message.create({sender, text, conversationId})
                return res.status(200).json({status: 'success', data: newMessage})
            } else if (!conversationId) {
                const conversation = await Conversation.findOne({
                    members: { $all: [sender, receiver] },
                });

                if (conversation){
                    const newMessage = await Message.create({sender, text, conversationId: conversation._id})
                    return res.status(200).json({status: 'success', data: newMessage})
                } else {
                    const newConversation = await Conversation.create({members: [sender, receiver]})
                    const newMessage = await Message.create({sender, text, conversationId: newConversation._id})
                    return res.status(200).json({status: 'success', data: newMessage})
                }
            } else if (!conversationId) {
                const newConversation = await Conversation.create({members: [sender, receiver]})
                const newMessage = await Message.create({sender, text, conversationId: newConversation._id})
                return res.status(200).json({status: 'success', data: newMessage})
            }

        } catch (error) {
            res.status(400).json({status: 'error', message: error.message})
        }
    }

    async getMessages (req, res) {
        try {
          const { conversationId } = req.params
          console.log(req.params)
          const messages = await Message.find({
            conversationId
          });

          res.status(200).json({status: 'success', data: messages});
        } catch (err) {
          res.status(400).json({status: 'error', message: error.message});
        }
    }

    async getOnlineUsers (req, res) {
        try {
            const { usersIds } = req.body

            // console.log(usersIds, 'ddd')
            const onlineUsers = await User.find({
                _id: { $in: [...usersIds] },
            })

            return res.status(200).json({status: 'success', data: onlineUsers})
        } catch (error) {
            res.status(400).json({status: 'error', message: error.message})
        }
    }


}

module.exports = new ChatController()