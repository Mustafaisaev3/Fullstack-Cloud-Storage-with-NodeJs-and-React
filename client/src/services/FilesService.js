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
        const response = await axios.post(`http://localhost:5000/api/files`,{
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

export const uploadFile = async (file, dirId) => {
    try {
        const formData = new FormData()
        formData.append('file', file)

        console.log(formData, 'formData')

        if(dirId) {
            formData.append('parent', dirId)
        }

        const response = await axios.post(`http://localhost:5000/api/files/upload`, formData, {
            headers: {Authorization: `Bearer ${localStorage.getItem('token')}`},
            onUploadProgress: progressEvent => {
                const totalLength = progressEvent.lengthComputable ? progressEvent.total : progressEvent.target.getResponseHeader('content-length') || progressEvent.target.getResponseHeader('x-decompressed-content-length');
                console.log('total', totalLength)
                if (totalLength) {
                    let progress = Math.round((progressEvent.loaded * 100) / totalLength)
                    console.log(progress)
                }
            }
        });
        
        console.log(response.data, 'hello')
        return response.data
        
    } catch (error) {
        console.log(error)
    }
}

export const downloadFile = async (file) => {
    try {
        const response = await fetch(`http://localhost:5000/api/files/download/?id=${file._id}`, {
            headers: {
                Authorization: `Bearer ${localStorage.getItem('token')}`
            }
        })

        if (response.status === 200){
            const blob = await response.blob()
            const downloadUrl = window.URL.createObjectURL(blob)
            console.log(downloadUrl)

            const link = document.createElement('a')
            link.href = downloadUrl
            link.download = file.name
            document.body.appendChild(link)
            link.click()
            link.remove()
        }
    } catch (error) {
        console.log('Download error ', error)
    }
}

export const deleteFile = async (file) => {
    try {
        const response = await axios.delete(`http://localhost:5000/api/files/?id=${file._id}`, {
            headers: {
                Authorization: `Bearer ${localStorage.getItem('token')}`
            }
        })

        return file._id

    } catch (error) {
        console.log('Delete error ', error)
    }
}

export const searchFile = async (searchWord) => {
    try {
        const response = await axios.get(`http://localhost:5000/api/files/search/?search=${searchWord}`, {
            headers: {
                Authorization: `Bearer ${localStorage.getItem('token')}`
            }
        })
        return response.data
        // console.log(response.data)
    } catch (error) {
        console.log(error)
    }
}

export default {getFiles, getAllFiles, createDir, uploadFile, downloadFile, deleteFile, searchFile};