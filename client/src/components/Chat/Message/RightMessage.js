import React from 'react'

const RightMessage = ({message}) => {
  return (
    <div className='w-full py-2 h-auto flex justify-end gap-4'>
        <div className='w-auto h-auto p-4 text-white bg-[#36a2eaaf] rounded-tl-3xl rounded-br-3xl self-end'>
            {message}
        </div>
        <div className='min-w-[50px] h-[50px] rounded-full bg-slate-400'></div>
    </div>
  )
}

export default RightMessage