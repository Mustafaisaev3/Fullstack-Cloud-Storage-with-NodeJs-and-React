import React from 'react'

const LeftMessage = ({message}) => {
  return (
    <div className='w-full py-2 h-auto flex gap-4 items-end'>
        <div className='min-w-[50px] h-[50px] rounded-full bg-slate-400'></div>
        <div className='w-auto h-[40px] p-2 text-[15px] text-[#000] bg-[#e3f2f5] rounded-lg rounded-bl-[0] self-start'>
            {message}
        </div>
    </div>
  )
}

export default LeftMessage