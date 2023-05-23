import React, {useEffect, useState} from 'react'

import io from "socket.io-client";

// const socket = io("http://localhost:5000");
const New = () => {
  // socket.on('connect', ()=>console.log('con'))
  // const soc = () => {
  //   socket.emit('hello', (data) => {
  //     console.log(data)
  //   })
  // }
    
  return (
    <div className='w-full h-full flex items-center justify-center'>
      <div className='w-[200px] h-[50px] rounded-md bg-sky-400'></div>
    </div>
  )
}

export default New