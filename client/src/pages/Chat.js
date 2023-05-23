import React, { useEffect, useLayoutEffect, useState, useRef } from 'react'
import ChatLeftBar from '../components/Chat/ChatLeftBar/ChatLeftBar'
import ChatPlace from '../components/Chat/ChatPlace/ChatPlace'
import { useSelector, useDispatch } from 'react-redux'
import { selectCurrentUser } from '../store/ducks/users/selectors'
import { selectOnlineUsers } from '../store/ducks/chat/selectors'
import { getOnlineUsers } from '../store/ducks/chat/actions'
import io from "socket.io-client";

const Chat = () => {
  const [activeConversation, setActiveConversation] = useState()
  const socket = useRef()

  const dispatch = useDispatch()

  const currentUser = useSelector(selectCurrentUser)
  const onlineUsers = useSelector(selectOnlineUsers)

  useLayoutEffect(() => {
    socket.current = io("http://localhost:5000", {
      // withCredentials: true,
    });
  }, [])
  
  // useEffect(() => {
  //   socket.current.on("getMessage", (data) => {
  //     const msg = {
  //       sender: data.sender,
  //       text: data.text,
  //       conversationId: data.conversationId,
  //       createdAt: Date.now(),
  //     }
  
  //     if (activeConversation._id === data.conversationId){
  //       dispatch(receiveMessage(msg))
  //     }
  //   });

  // }, [activeConversation])

  useEffect(() => {
    socket.current.emit('addUser', currentUser.id)
    socket.current.on('getUsers', (users) => {
      const onlineUsersArr = users.map((user) => {
        return user.userId
      })

      dispatch(getOnlineUsers(onlineUsersArr))
    })
  }, [currentUser, socket.current])

  return (
    <div className='flex w-full h-full font-bold py-5 overflow-hidden'>
      <div className='w-full'>
        <div className='text-2xl text-[#8997a1]'>Chat</div>
        {onlineUsers ? onlineUsers.map(user => {
          return <div>{user.username}</div>
        }) : null}
        <div className='w-full h-full flex py-7 gap-2'>


            <ChatLeftBar usersOnline={onlineUsers} setActiveConversation={setActiveConversation}   />


            <ChatPlace activeConversation={activeConversation} socket={socket.current}/>

        </div>
      </div>
    </div>
  )
}

export default Chat
