export const selectChat = (state) => state.chat
export const selectAllUsers = (state) => selectChat(state).users
export const selectOnlineUsers = (state) => selectChat(state).onlineUsers
export const selectMessages = (state) => selectChat(state).messages
export const selectUserConversations = (state) => selectChat(state).userConversations
export const selectActiveCompanion = (state) => selectChat(state).activeСompanion
export const selectActiveConversation = (state) => selectChat(state).activeConversation
export const selectActiveConversationMessages = (state) => selectChat(state).activeConversation.messages