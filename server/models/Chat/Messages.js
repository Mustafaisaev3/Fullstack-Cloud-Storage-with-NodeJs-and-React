import { Schema, model } from "mongoose";


export const MessagesSchema = new Schema({
    message: {
        type: String,
        require: true
    },
    sender: {
        type: ObjectId, 
        ref: 'User',
        require: true
    },
    conversation: {
        type: ObjectId, 
        ref: 'Conversation',
        require: true
    }
}, {timestamps: true})

module.exports = model('Messages', MessagesSchema)