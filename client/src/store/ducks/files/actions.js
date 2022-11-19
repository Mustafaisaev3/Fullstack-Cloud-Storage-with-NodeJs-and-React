import FilesService from "../../../services/FilesService"
import { getFilesWithStructure } from "../../../utils/get-files-with-structure"
import { addUploadFile } from "../uploads/actions"

export const SET_FILES = 'files/SET_FILES'
export const SET_ALL_FILES = 'files/SET_ALL_FILES'
export const SET_CURRENT_DIR = 'files/SET_CURRENT_DIR'
export const ADD_FILE = 'files/ADD_FILE'
export const DELETE_FILE = 'files/DELETE_FILE'

export const setAllFiles = () => {
    return dispatch => {
        FilesService.getAllFiles()
            .then(response => {
                dispatch({
                    type: SET_ALL_FILES,
                    payload: getFilesWithStructure(response)
                })
            })
    }
}

export const setFiles = (dirId) => {
    return dispatch => {
        FilesService.getFiles(dirId)
            .then(response => {
                // console.log(getFilesWithStructure(response),'hello2')
                dispatch({
                    type: SET_FILES,
                    payload: response
                })
            })
    }
}

export const setCurrentDir = (dir) => ({
    type: SET_CURRENT_DIR,
    payload: dir
})

export const addFile = (dirId, name) => {
    return dispatch => {
        FilesService.createDir(dirId, name)
            .then(response => {
                dispatch({
                    type: ADD_FILE,
                    payload: response
                })
            })
    }
}

export const uploadFile = (file, dirId) => {
    return dispatch => {
        FilesService.uploadFile(file, dirId)
            .then(response => {
                const uploadFile = {name: file.name, progress: 0}
                dispatch(addUploadFile(uploadFile))
                dispatch({
                    type: ADD_FILE,
                    payload: response
                })
            })
    }
}

export const deleteFile = (file) => {
    return dispatch => {
        FilesService.deleteFile(file)
            .then(response => {
                dispatch({
                    type: DELETE_FILE,
                    payload: response
                })
            })
    }
}

export const searchFile = (searchWord) => {
    return dispatch => {
        FilesService.searchFile(searchWord)
            .then(response => {
                dispatch({
                    type: SET_FILES,
                    payload: response
                })
            })
    }
}