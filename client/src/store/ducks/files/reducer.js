import { SET_FILES, SET_CURRENT_DIR, ADD_FILE, SET_ALL_FILES, DELETE_FILE } from "./actions"

const initialState = {
    allFiles: [],
    files: [],
    currentdir: null
}

export const fileReducer = (state = initialState, action) => {
    switch(action.type){
        
        case SET_FILES:
            return {...state, files: action.payload}

        case SET_ALL_FILES:
            return {...state, allFiles: action.payload}

        case SET_CURRENT_DIR:
            return {...state, currentdir: action.payload}

        case ADD_FILE:
            return {...state, files: [...state.files, action.payload]}

        case DELETE_FILE:
            return {...state, files: [...state.files.filter(file => file._id !== action.payload) ]}

        default:
            return state
    }
}
