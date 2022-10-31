import axios from 'axios'

export const registration = async (email, password) => {
    try {
        const response = await axios.post('http://localhost:5000/api/auth/registration', {
            email,
            password
        })

        if(response.status === 200){
            return {
                status: true,
                message: 'User successfuly registered',
                data: response.data
            }
        } else {
            return {
                status: false,
                message: `Registration error`,
              };
        }
    } catch (error) {
        alert(error.response.data.message)
    }

}

export const login = async (email, password) => {

    try {
        const response = await axios.post('http://localhost:5000/api/auth/login', {
            email,
            password
        })

        if(response.status === 200){
            localStorage.setItem('token', response.data.token)
            return {
                status: true,
                message: 'User loged',
                data: response.data
            }
        } else {
            return {
                status: false,
                message: `User not found`,
              };
        }


    } catch (error) {
        alert(error.response.data.message)
    }
}

export const auth = async () => {

    try {
        const response = await axios.get('http://localhost:5000/api/auth/auth', {
            headers: {Authorization: `Bearer ${localStorage.getItem('token')}`}
        })

        if(response.status === 200){
            localStorage.setItem('token', response.data.token)
            console.log(response.data)
            return {
                status: true,
                message: 'User loged',
                data: response.data
            }
        } else {
            return {
                status: false,
                message: `User not found`,
              };
        }

    } catch (error) {
        alert(error.response.data.message)
        localStorage.removeItem('token')
    }
}

export default {login, registration, auth};