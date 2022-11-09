import { SET_FILES, SET_CURRENT_DIR } from "./actions"

const initialState = {
    files: [],
    currentdir: null
}

export const fileReducer = (state = initialState, action) => {
    switch(action.type){
        
        case SET_FILES:
            return {...state, files: action.payload}

        case SET_CURRENT_DIR:
            return {...state, currentdir: action.payload}

        default:
            return state
    }
}