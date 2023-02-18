export const selectChat = (state) => state.chat
export const selectActiveCompanion = (state) => selectChat(state).activeСompanion
export const selectActiveConversation = (state) => selectChat(state).activeConversation
export const selectActiveConversationMessages = (state) => selectChat(state).activeConversation.messages