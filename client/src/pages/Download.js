import React from 'react'
import { BsImageFill } from 'react-icons/bs'

const Download = () => {
  return (
    <div className='w-full h-screen bg-[#e3f2f5] relative'>
        <div className='header w-full h-auto p-[40px] flex items-center justify-between absolute left-0 top-0'>
            <div className='w-[70px] h-[70px] flex items-center justify-center cursor-pointer p-3 bg-white rounded-xl'>
                <img src='assets/logo.png' alt='logo' />
            </div>
            <div className='flex items-center gap-4'>
                <div className='w-[100px] h-[50px] flex items-center justify-center rounded-md bg-[#6deeff]'>login</div>
                <div className='w-[100px] h-[50px] flex items-center justify-center rounded-md bg-[#6dffe4]'>register</div>
            </div>
        </div>

        <div className='body w-full h-full flex items-center justify-center'>
            <div className='w-[1000px] h-[600px] flex flex-col items-center rounded-lg bg-white border-[3px] border-[#41c3ff]'>
                <div className='flex-1 flex items-center justify-center'>
                    <BsImageFill size={200} color={'#36a1ea'} />
                </div> 
                <div className='w-full h-[60px] bg-[#41c3ff] flex justify-between items-center px-5'>
                    <div className='text-white text-[18px]'>new_web.png</div>
                    <div className='w-[150px] h-[50px] flex items-center justify-center rounded-md bg-white'>download</div>
                </div>
            </div>
        </div>
    </div>
  )
}

export default Download