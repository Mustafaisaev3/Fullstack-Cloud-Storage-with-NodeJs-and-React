import { SET_ACTIVE_COMPANION, SET_ACTIVE_CONVERSATION, GET_MESSAGES, GET_ALL_USERS, GET_USER_CONVERSATIONS, SEND_MESSAGE, GET_ONLINE_USERS, RECEIVE_MESSAGE } from "./actions"

const initialState = {
    activeСompanion: '',
    activeConversation: '',
    userConversations: [],
    users: [],
    onlineUsers: [],
    messages: []
}

export const chatReducer = (state = initialState, action) => {
    switch (action.type) {

        case GET_ALL_USERS:
            // console.log(action.payload)
            return {...state, users: action.payload}

        case GET_ONLINE_USERS:
            // console.log(action.payload)
            return {...state, onlineUsers: action.payload}
            
        case GET_USER_CONVERSATIONS:
            // console.log(action.payload)
            return {...state, userConversations: action.payload}

        case GET_MESSAGES:
            // console.log(action.payload)
            return {...state, messages: action.payload}

        case SEND_MESSAGE:
            // console.log(action.payload)
            // const msgs = state.messages.push(action.payload)
            return {...state, messages: [...state.messages, action.payload]}
            
        case RECEIVE_MESSAGE:
            return {...state, messages: [...state.messages, action.payload]}


        case SET_ACTIVE_COMPANION:
            return {...state, activeСompanion: action.payload}

        case SET_ACTIVE_CONVERSATION:
            return {...state, activeConversation: action.payload}

        default: 
            return state
    }
}