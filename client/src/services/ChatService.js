import axios from "axios";

export const getUserConversations = async (userId) => {
    try {
        const response = await axios.get(`http://localhost:5000/api/chat/${userId}`, {
                headers: {Authorization: `Bearer ${localStorage.getItem('cloud_token')}`}
            })
        return response.data
        
    } catch (error) {
        console.log(error)
    }
}

export const getAllUsers = async () => {
    try {
        const response = await axios.get(`http://localhost:5000/api/chat/users`, {
                headers: {Authorization: `Bearer ${localStorage.getItem('cloud_token')}`}
            })
        return response.data
        
    } catch (error) {
        console.log(error)
    }
}

export const searchUser = async (searchStr) => {
    try {
        const response = await axios.get(`http://localhost:5000/api/chat/serach-user/?search=${searchStr}`, {
                headers: {Authorization: `Bearer ${localStorage.getItem('cloud_token')}`}
            })
        return response.data
        
    } catch (error) {
        console.log(error)
    }
}

export const sendMessage = async (payload) => {
    try {
        const response = await axios.post(`http://localhost:5000/api/chat/message`, payload, {
                headers: {Authorization: `Bearer ${localStorage.getItem('cloud_token')}`}
            })
        return response.data
        
    } catch (error) {
        console.log(error)
    }
}

export const getMessages = async (conversationId) => {
    try {
        const response = await axios.get(`http://localhost:5000/api/chat/messages/${conversationId}`, {
                headers: {Authorization: `Bearer ${localStorage.getItem('cloud_token')}`}
            })
        return response.data
        
    } catch (error) {
        console.log(error)
    }
}

export const getOnlineUsers = async (onlineUsersIds) => {
    try {
        const response = await axios.post(`http://localhost:5000/api/chat/online-users`,{usersIds: onlineUsersIds}, {
                headers: {Authorization: `Bearer ${localStorage.getItem('cloud_token')}`}
            })
        return response.data
        
    } catch (error) {
        console.log(error)
    }
}


export default {getAllUsers, searchUser, getUserConversations, sendMessage, getMessages, getOnlineUsers};