import axios from "axios";

export const getFiles = async (dirId) => {
    try {
        const response = await axios.get(`http://localhost:5000/api/files${dirId ? '?parent='+dirId : ''}`, {
                headers: {Authorization: `Bearer ${localStorage.getItem('token')}`}
            })
        console.log(response.data, 'hello')
        return response.data
        
    } catch (error) {
        console.log(error)
    }
}

export default {getFiles};