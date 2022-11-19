import { ADD_UPLOAD_FILE, REMOVE_UPLOAD_FILE, CHANGE_UPLOAD_FILE } from "./actions"

const initialState = {
    files: []
}

export const uploadsReducer = (state = initialState, action) => {
    switch (action.type) {
        case ADD_UPLOAD_FILE:
            return {...state, files: [...state.files, {...action.payload, id: state.files.length}]}
        case REMOVE_UPLOAD_FILE:
            console.log('remove')
            return {...state, files: [...state.files.filter(file => file.id !== action.payload)]}
        case CHANGE_UPLOAD_FILE:
            return {...state, files: [...state.files.filter(file => file.id !== action.payload
                ? {...file, progress: action.payload.progress}
                : {...file}
                )]}
        default: 
            return state
    }
}