import { LOGIN_USER, LOGOUT_USER, SET_USER } from "./actions"

const initialState = {
    currentUser: {},
    isAuth: false
}

export const userReducer = (state = initialState, action) => {
    switch(action.type){

        case LOGIN_USER:
            return {
                ...state,
                currentUser: {...action.payload},
                isAuth: true
            }

        case LOGOUT_USER:
            return {
                ...state,
                currentUser: {},
                isAuth: false
            }

        case SET_USER:
            return {
                ...state,
                currentUser: {...action.payload},
                isAuth: true
            }

        default:
            return state
    }
}