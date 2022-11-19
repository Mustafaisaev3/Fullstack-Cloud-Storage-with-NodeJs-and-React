

export const ADD_UPLOAD_FILE = 'uploads/ADD_UPLOAD_FILE'
export const REMOVE_UPLOAD_FILE = 'uploads/REMOVE_UPLOAD_FILE'
export const CHANGE_UPLOAD_FILE = 'uploads/CHANGE_UPLOAD_FILE'


export const addUploadFile = (file) => ({
    type: ADD_UPLOAD_FILE,
    payload: file
})

export const removeUploadFile = (file) => ({
    type: REMOVE_UPLOAD_FILE,
    payload: file.id
})

export const changeUploadFile = (file) => ({
    type: CHANGE_UPLOAD_FILE,
    payload: file.id
})