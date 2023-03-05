import { Schema, model, ObjectId } from "mongoose";

const ConversationChema = new Schema({
    users: [{type: ObjectId, ref: 'User'}],
    date: {type: Date, default: Date.now()},
}, {timestamps: true})

module.exports = model('Conversation', ConversationChema)