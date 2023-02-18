import { SET_ACTIVE_COMPANION, SET_ACTIVE_CONVERSATION, GET_CONVERSATIONS, GET_MESSAGES } from "./actions"

const initialState = {
    activeСompanion: '',
    activeConversation: ''
}

export const chatReducer = (state = initialState, action) => {
    switch (action.type) {

        case SET_ACTIVE_COMPANION:
            return {...state, activeСompanion: action.payload}

        case SET_ACTIVE_CONVERSATION:
            return {...state, activeConversation: action.payload}

        default: 
            return state
    }
}