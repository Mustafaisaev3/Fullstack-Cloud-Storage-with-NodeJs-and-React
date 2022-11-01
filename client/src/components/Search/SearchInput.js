import React from 'react'
import { BsSearch } from 'react-icons/bs'

const SearchInput = (props) => {
  return (
    <div className='w-[500px] h-[50px] px-3 bg-white rounded-2xl flex items-center overflow-hidden'>
        <div>
            <BsSearch size={20} color={'#8997a1'} />
        </div>
        <input type="text" className='h-full w-full pl-3 outline-none' {...props}/>        
    </div>
  )
}

export default SearchInput