import FilesService from "../../../services/FilesService"

export const SET_FILES = 'files/SET_FILES'
export const SET_CURRENT_DIR = 'files/SET_CURRENT_DIR'

// export const setFiles = (files) => ({
//     type: SET_FILES,
//     payload: files
// })
export const setFiles = (dirId) => {
    return dispath => {
        FilesService.getFiles(dirId)
            .then((responce) => console.log(dirId))
    }
}

export const setCurrentDir = (dir) => ({
    type: SET_CURRENT_DIR,
    payload: dir
})