

export const SET_ACTIVE_COMPANION = 'chat/SET_ACTIVE_COMPANION'
export const SET_ACTIVE_CONVERSATION = 'chat/SET_ACTIVE_CONVERSATION'
export const GET_CONVERSATIONS = 'chat/GET_CONVERSATIONS'
export const GET_MESSAGES = 'chat/GET_MESSAGES'


export const setActiveCompanion = (user) => ({
    type: SET_ACTIVE_COMPANION,
    payload: user
})

export const setActiveConversation = (conversation) => ({
    type: SET_ACTIVE_CONVERSATION,
    payload: conversation
})

export const getConversations = (userId) => ({
    type: GET_CONVERSATIONS,
    payload: userId
})

export const getMessages = (conversationId, companion) => ({
    type: GET_MESSAGES,
    payload: {
        conversationId, 
        companion
    }
})
