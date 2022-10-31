import AuthService from "../../../services/AuthService"

export const LOGIN_USER = 'auth/LOGIN_USER'
export const LOGOUT_USER = 'auth/LOGOUT_USER'
export const SET_USER = 'auth/SET_USER'
export const REGISTER_USER = 'auth/REGISTER_USER'


export const UserRegistration = (email, password) => {
    return dispatch => {

    }
}

export const LogoutUser = () => {
    localStorage.removeItem('token')
    return {
        type: LOGOUT_USER
    }
}

export const LoginUser = (email, password) => {
    return dispatch => {
        AuthService.login(email,password)
            .then((response) => {
                dispatch({
                    type: LOGIN_USER,
                    payload: response.data
                })
            })
    }
}

export const SetUser = () => {
    return dispatch => {
        AuthService.auth()
            .then((response) => {
                dispatch({
                    type: SET_USER,
                    payload: response.data
                })
            })
    }
}