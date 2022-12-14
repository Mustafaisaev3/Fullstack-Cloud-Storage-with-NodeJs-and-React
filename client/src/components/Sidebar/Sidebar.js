import React from 'react'
import { HiHome } from 'react-icons/hi'
import { CgFileDocument } from 'react-icons/cg'
import { FaUsers, FaFolder } from 'react-icons/fa'
import { BiMessageSquareDots } from 'react-icons/bi'
import { SlSettings } from 'react-icons/sl'
import { AiOutlineCloudUpload } from 'react-icons/ai'
import MenuItem from './MenuItem'


const Sidebar = () => {
  return (
    <div className='h-screen w-[100px] py-[50px] fixed bg-[#36a1ea] top-0 left-0 flex flex-col items-center'>
        <div className='pb-[50px]'>
            <div className='w-[70px] h-[70px] flex items-center justify-center cursor-pointer p-3 bg-white rounded-xl'>
                <img src='assets/logo.png' />
            </div>
        </div>
        <div className='h-full flex flex-col items-center justify-between'>
            <div className='w-full flex flex-col gap-4 '>
                <MenuItem active={true}>
                    <a href="/">
                        <HiHome size={40} color={'white'} />
                    </a>
                </MenuItem>
                <MenuItem>
                    <a href="/files">
                        <FaFolder size={40} color={'white'} />
                    </a>
                </MenuItem>
                <MenuItem>
                    <FaUsers size={40} color={'white'} />
                </MenuItem>
                <MenuItem>
                    <BiMessageSquareDots size={40} color={'white'} />
                </MenuItem>
                <MenuItem>
                    <SlSettings size={40} color={'white'} />
                </MenuItem>
            </div>
            <div>
                <MenuItem>
                    <AiOutlineCloudUpload size={40} color={'white'} />
                </MenuItem>
            </div>
        </div>
    </div>
  )
}

export default Sidebar