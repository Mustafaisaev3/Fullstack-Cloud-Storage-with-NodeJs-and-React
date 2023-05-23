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

        console.log(response, 'gggggg')

        localStorage.setItem('cloud_token', response.data.token)
        if(response.status === 200){
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
            headers: {Authorization: `Bearer ${localStorage.getItem('cloud_token')}`},
            withCredentials: true
        })

        console.log(response, 'gggggg')

        localStorage.setItem('cloud_token', response.data.token)
        if(response.status === 200){
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