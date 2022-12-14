import {combineReducers} from 'redux'
import { fileReducer } from './ducks/files/reducer'
import { userReducer } from './ducks/users/reducer'

export const rootReducer = combineReducers({
    files: fileReducer,
    user: userReducer
})