import ChatService from "../../../services/ChatService"


export const GET_USER_CONVERSATIONS = 'chat/GET_USER_CONVERSATIONS'
export const GET_ALL_USERS = 'chat/GET_ALL_USERS'
export const GET_ONLINE_USERS = 'chat/GET_ONLINE_USERS'
export const SEND_MESSAGE = 'chat/SEND_MESSAGE'
export const RECEIVE_MESSAGE = 'chat/RECEIVE_MESSAGE'
export const SEARCH_USER = 'chat/SEARCH_USER'
export const SET_ACTIVE_COMPANION = 'chat/SET_ACTIVE_COMPANION'
export const SET_ACTIVE_CONVERSATION = 'chat/SET_ACTIVE_CONVERSATION'
export const GET_CONVERSATIONS = 'chat/GET_CONVERSATIONS'
export const GET_MESSAGES = 'chat/GET_MESSAGES'


export const setActiveCompanion = (user) => ({
    type: SET_ACTIVE_COMPANION,
    payload: user
})

export const getUserConversations = (payload) => {
    return dispatch => {
        ChatService.getUserConversations(payload)
            .then(response => {
                dispatch({
                    type: GET_USER_CONVERSATIONS,
                    payload: response.data
                })
            })
    }
}

export const getAllUsers = () => {
    return dispatch => {
        ChatService.getAllUsers()
            .then(response => {
                dispatch({
                    type: GET_ALL_USERS,
                    payload: response.users
                })
            })
    }
}

export const searchUser = (searchStr) => {
    return dispatch => {
        ChatService.searchUser(searchStr)
            .then(response => {
                dispatch({
                    type: SEARCH_USER,
                    payload: response.search
                })
            })
    }
}

export const sendMessage = (payload) => {
    return dispatch => {
        ChatService.sendMessage(payload)
            .then(response => {
                dispatch({
                    type: SEND_MESSAGE,
                    payload: response.data
                })
            })
    }
}

export const receiveMessage = (msg) => ({
    type: RECEIVE_MESSAGE,
    payload: msg
})

export const getMessages = (payload) => {
    return dispatch => {
        ChatService.getMessages(payload)
            .then(response => {
                dispatch({
                    type: GET_MESSAGES,
                    payload: response.data
                })
            })
    }
}

export const getOnlineUsers = (payload) => {
    return dispatch => {
        ChatService.getOnlineUsers(payload)
            .then(response => {
                dispatch({
                    type: GET_ONLINE_USERS,
                    payload: response.data
                })
            })
    }
}


export const setActiveConversation = (conversation) => ({
    type: SET_ACTIVE_CONVERSATION,
    payload: conversation
})

export const getConversations = (userId) => ({
    type: GET_CONVERSATIONS,
    payload: userId
})

// export const getMessages = (conversationId, companion) => ({
//     type: GET_MESSAGES,
//     payload: {
//         conversationId, 
//         companion
//     }
// })
