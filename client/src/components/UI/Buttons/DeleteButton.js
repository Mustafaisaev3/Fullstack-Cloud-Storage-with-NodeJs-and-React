import React from 'react'
import { MdDeleteForever } from 'react-icons/md'
import { useDispatch } from 'react-redux'
import { deleteFile } from '../../../store/ducks/files/actions'

const DeleteButton = ({file}) => {
    const dispatch = useDispatch()
    const handleDeleteClick = (file) => {
        dispatch(deleteFile(file))
        }

    return (
        <div className='w-[30px] h-[30px] flex items-center justify-center bg-[#ff6f6f] text-black text-center p-1 rounded-md cursor-pointer' onClick={() => handleDeleteClick(file)}>
            <MdDeleteForever size={20} color={'black'}/>
        </div>
    )
}

export default DeleteButton