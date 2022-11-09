import React from 'react'
import {IoMdClose} from 'react-icons/io'
import { useUI } from '../../context/ui.context'

const AddFolderView = () => {
    const {closeModal} = useUI()
  return (
    <div className='w-auto h-auto bg-white rounded-md'>
        <div className='w-full p-[15px] flex justify-end border-b-[1px]'>
            <div className='cursor-pointer' onClick={() => closeModal()}>
                <IoMdClose size={25} color={'#1d9bf0'}/>
            </div>
        </div>
        <div className='p-[15px]     w-[400px] h-[300] rounded-lg bg-white'>
            
        </div>
    </div>
  )
}

export default AddFolderView