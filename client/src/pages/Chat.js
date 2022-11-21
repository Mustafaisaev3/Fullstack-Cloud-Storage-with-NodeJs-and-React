import React from 'react'
import ChatLeftBar from '../components/Chat/ChatLeftBar/ChatLeftBar'
import ChatPlace from '../components/Chat/ChatPlace/ChatPlace'

const Chat = () => {
  return (
    <div className='flex w-full h-full font-bold py-5 overflow-hidden'>
      <div className='w-full'>
        <div className='text-2xl text-[#8997a1]'>Chat</div>
        <div className='w-full h-full flex py-7 gap-2'>


            <ChatLeftBar />


            <ChatPlace />


            <div className='w-[350px] h-full rounded-md bg-white'></div>


        </div>
      </div>
    </div>
  )
}

export default Chat