const { ObjectId, model, Schema } = require('mongoose')


// const MessagesSchema = new Schema({
//     text: {
//         type: String,
//         require: true
//     },
//     sender: {
//         type: ObjectId, 
//         ref: 'User',
//         require: true
//     },
//     recipient: {
//         type: ObjectId, 
//         ref: 'User',
//         require: true
//     }
// }, {timestamps: true})

// module.exports = model('Message', MessagesSchema)

const MessageSchema = new Schema(
  {
    conversationId: {
      type: String,
    },
    sender: {
      type: String,
    },
    text: {
      type: String,
    },
  },
  { timestamps: true }
);

module.exports = model("Message", MessageSchema);