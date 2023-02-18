import {combineReducers} from 'redux'
import { chatReducer } from './ducks/chat/reducer'
import { fileReducer } from './ducks/files/reducer'
import { uploadsReducer } from './ducks/uploads/reducer'
import { userReducer } from './ducks/users/reducer'

export const rootReducer = combineReducers({
    files: fileReducer,
    user: userReducer, 
    uploads: uploadsReducer,
    chat: chatReducer
})