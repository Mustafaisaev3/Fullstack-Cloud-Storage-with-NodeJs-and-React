const { ObjectId, model, Schema } = require('mongoose')

const Conversation = new Schema({
    messages: [{type: ObjectId, ref: 'Message'}],
    users: [{type: ObjectId, ref: 'User'}],
    date: {type: Date, default: Date.now()},
},{ timestamps: true })

module.exports = model('Conversation', Conversation)