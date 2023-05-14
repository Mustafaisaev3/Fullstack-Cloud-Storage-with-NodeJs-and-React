import React from 'react'
import SearchInput from '../Search/SearchInput'
// import {AiOutlineBell} from 'react-icons/ai'
import {FaRegBell, FaUser} from 'react-icons/fa'
import {BsFolderPlus} from 'react-icons/bs'
import {BiDotsVerticalRounded} from 'react-icons/bi'
import { useUI } from '../../context/ui.context'

const Topbar = ({setShowInfobar}) => {
    const {openModal, setModalView, showModal, modalView, openUploader} = useUI()

    const addFolderBtnClick = () => {
        setModalView('ADD_FOLDER_VIEW')
        console.log(showModal, modalView)
        openModal()
    }

  return (
    <div className='w-full flex justify-between items-center py-5'>
        <SearchInput />
        {/* <div className='flex items-center justify-center w-[200px] h-full p-[10px] rounded-lg bg-[#2ba7ff] text-white cursor-pointer' onClick={addFolderBtnClick}>
            <BsFolderPlus color='white' size={25} className='mr-3' />
            Add Folder
        </div> */}
        <div className='flex items-center gap-4'>
            <div className='cursor-pointer'>
                <FaRegBell size={25} color={'#8997a1'} />
            </div>
            <div className='flex items-center pl-6'>
                <div className='pr-2'>Hi, Danik</div>
                <div className='w-[50px] h-[50px] flex items-center justify-center rounded-full bg-[#8997a1]' onClick={() => openUploader()}>
                    <FaUser size={20} color={'white'} />
                </div>
            </div>
            <div className='cursor-pointer' onClick={() => setShowInfobar(true)}>
                <BiDotsVerticalRounded size={30} color={'black'} />
            </div>
        </div>
    </div>
  )
}

export default Topbar