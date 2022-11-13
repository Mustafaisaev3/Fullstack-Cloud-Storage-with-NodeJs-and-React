import React from 'react'
import { useState } from 'react'
import {IoMdClose} from 'react-icons/io'
import { useDispatch, useSelector } from 'react-redux'
import { useUI } from '../../context/ui.context'
import { addFile } from '../../store/ducks/files/actions'
import { selectCurrentDir } from '../../store/ducks/files/selectors'
import Input from '../Input/Input'

const AddFolderView = () => {
    const [folderNameInput, setFolderNameInput] = useState('')
    const {closeModal} = useUI()
    const dispatch = useDispatch()

    const currentDir = useSelector(selectCurrentDir)

    const handleCreateCurrentDirBtnClick = () => {
        dispatch(addFile(currentDir, folderNameInput))
        closeModal()
    }
  return (
    <div className='w-auto h-auto bg-white rounded-md'>
        <div className='w-full p-[15px] flex justify-between border-b-[1px]'>
            <div className='text-[#7c8d96] text-[20px]'>
                Create new folder
            </div>
            <div className='cursor-pointer' onClick={() => closeModal()}>
                <IoMdClose size={25} color={'#1d9bf0'}/>
            </div>
        </div>
        <div className='p-[15px] w-[400px] h-[300] rounded-lg bg-white'>
            <Input placeholder="Folder name" value={folderNameInput} onChange={(e) => setFolderNameInput(e.target.value)} />
            <div className='flex items-center justify-end'>
                <div className='flex items-center justify-center w-[100px] h-full p-[8px] rounded-lg bg-[#2ba7ff] text-white cursor-pointer' onClick={handleCreateCurrentDirBtnClick}>Add</div>
            </div>
        </div>
    </div>
  )
}

export default AddFolderView