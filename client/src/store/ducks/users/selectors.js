export const selectUserInfo = (state) => state.user
export const selectCurrentUser = (state) => selectUserInfo(state).currentUser
export const selectIsAuth = (state) => selectUserInfo(state).isAuth