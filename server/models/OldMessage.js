const { ObjectId, model, Schema } = require('mongoose')

const Message = new Schema({
    message: {type: String, required: true}, 
    from: {type: ObjectId, ref: 'User'},
    to: {type: ObjectId, ref: 'User'},
    files: [{type: ObjectId, ref: 'File'}],
    // users: [{type: ObjectId, ref: 'User'}],
    date: {type: Date, default: Date.now()},
}, { timestamps: true })

module.exports = model('Message', Message)