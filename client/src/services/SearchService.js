import axios from "axios";

export const searchFile = async (payload) => {
    try {
        const response = await axios.post(`http://localhost:5000/api/search`, payload, {
                headers: {Authorization: `Bearer ${localStorage.getItem('cloud_token')}`}
            })
        return response.data
        
    } catch (error) {
        console.log(error)
    }
}