import axios from "axios";

export const getAllFiles = async () => {
    try {
        const response = await axios.get(`http://localhost:5000/api/files`, {
                headers: {Authorization: `Bearer ${localStorage.getItem('token')}`}
            })
        return response.data
        
    } catch (error) {
        console.log(error)
    }
}

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

export const getFile = async (id) => {
    try {
        const response = await axios.get(`http://localhost:5000/api/files/file`, {
           id: id
        }, {
                headers: {Authorization: `Bearer ${localStorage.getItem('token')}`}
            })
        console.log(response.data, 'file')
        return response.data
        
    } catch (error) {
        console.log(error)
    }
}

export const createDir = async (dirId, name) => {
    try {
        const response = await axios.get(`http://localhost:5000/api/files`,{
            name,
            parent: dirId,
            type: 'dir'
        } ,
        {  headers: {Authorization: `Bearer ${localStorage.getItem('token')}`}  })
        
        console.log(response.data, 'hello')
        return response.data
        
    } catch (error) {
        console.log(error)
    }
}

export default {getFiles, getAllFiles, createDir};