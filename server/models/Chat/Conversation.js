const { ObjectId, model, Schema } = require('mongoose')

// const ConversationChema = new Schema({
//     messages: [{type: ObjectId, ref: 'Message'}],
//     users: [{type: ObjectId, ref: 'User'}],
//     date: {type: Date, default: Date.now()},
// }, {timestamps: true})

// module.exports = model('Conversation', ConversationChema)

const ConversationSchema = new Schema(
    {
      members: {
        type: Array,
      },
    },
    { timestamps: true }
);
  
module.exports = model("Conversation", ConversationSchema);