export const selectFilesState = (state) => state.files
export const selectAllFiles = (state) => selectFilesState(state).allFiles
export const selectFiles = (state) => selectFilesState(state).files
export const selectCurrentDir = (state) => selectFilesState(state).currentdir