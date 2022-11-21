import React from 'react'
import Input from '../../Input/Input'
import { FaTelegramPlane } from 'react-icons/fa'
import { AiOutlinePaperClip } from 'react-icons/ai'
import LeftMessage from '../Message/LeftMessage'
import RightMessage from '../Message/RightMessage'

const ChatPlace = () => {
  return (
    <div className='h-full flex flex-col grow rounded-md bg-white'>

        <div className='flex items-center gap-3 p-5  border-b-[1px]'>
            <div className='w-[50px] h-[50px] rounded-full bg-slate-400'></div>
            <div>
                <div>Sam Samual</div>
                <div className='flex gap-1 items-center'> <div className='w-2 h-2 rounded-full bg-[#3cff26]'></div> online</div>
            </div>
        </div>

        <div className='w-full gap-3 grow p-5 flex flex-col'>
            <LeftMessage />
            <RightMessage />
            <RightMessage />
            <LeftMessage />
        </div>

        <div className='w-full h-[80px] gap-3 p-5 border-t-[1px] flex items-center'>
            <Input placeholder={'Search word'} />
            <div className='rounded-full p-2 cursor-pointer' >
                <AiOutlinePaperClip size={20} className={''} />
            </div>
            <div className='rounded-full p-2 bg-[#36a1ea] cursor-pointer' >
                <FaTelegramPlane size={20} color={'white'} className={''} />
            </div>
        </div>
    </div>
  )
}

export default ChatPlace