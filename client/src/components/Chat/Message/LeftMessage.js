import React from 'react'

const LeftMessage = ({message}) => {
  return (
    <div className='w-full py-2 h-auto flex gap-4'>
        <div className='min-w-[50px] h-[50px] rounded-full bg-slate-400'></div>
        <div className='w-auto h-[60px] p-4 text-white bg-[#36a2eaaf] rounded-tl-3xl rounded-br-3xl self-start'>
            {message}
        </div>
    </div>
  )
}

export default LeftMessage