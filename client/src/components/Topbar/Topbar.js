import React from 'react'
import SearchInput from '../Search/SearchInput'
// import {AiOutlineBell} from 'react-icons/ai'
import {FaRegBell, FaUser} from 'react-icons/fa'

const Topbar = () => {
  return (
    <div className='flex justify-between items-center'>
        <SearchInput />
        <div className='flex items-center'>
            <div className='cursor-pointer'>
                <FaRegBell size={25} color={'#8997a1'} />
            </div>
            <div className='flex items-center pl-6'>
                <div className='pr-2'>Hi, Danik</div>
                <div className='w-[50px] h-[50px] flex items-center justify-center rounded-full bg-[#8997a1]'>
                    <FaUser size={20} color={'white'} />
                </div>
            </div>
        </div>
    </div>
  )
}

export default Topbar