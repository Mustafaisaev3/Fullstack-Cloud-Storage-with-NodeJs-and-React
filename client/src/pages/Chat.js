import React, { useEffect, useState } from 'react'
import axios from 'axios'
import ChatLeftBar from '../components/Chat/ChatLeftBar/ChatLeftBar'
import ChatPlace from '../components/Chat/ChatPlace/ChatPlace'
import { useSelector } from 'react-redux'
import { selectCurrentUser } from '../store/ducks/users/selectors'
import { selectActiveConversation } from '../store/ducks/chat/selectors'

const Chat = () => {
  const [users, setUsers] = useState()
  // const [activeConversation, setActiveConversation] = useState(null)
  const activeConversation = useSelector(selectActiveConversation)
  const getUsers = async () => {
    const response = await axios.get(`http://localhost:5000/api/chat`, {
      headers: {
          Authorization: `Bearer ${localStorage.getItem('token')}`
      }
    })
    setUsers(response.data)
  }

  const currentUser = useSelector(selectCurrentUser)

  useEffect(() => {
    getUsers()
  }, [])

  

  return (
    <div className='flex w-full h-full font-bold py-5 overflow-hidden'>
      <div className='w-full'>
        <div className='text-2xl text-[#8997a1]'>Chat</div>
        <div className='w-full h-full flex py-7 gap-2'>


            <ChatLeftBar currentUser={currentUser} users={users}  />


            <ChatPlace currentUser={currentUser} />


            {/* <div className='w-[350px] h-full rounded-md bg-white'></div> */}


        </div>
      </div>
    </div>
  )
}

export default Chat