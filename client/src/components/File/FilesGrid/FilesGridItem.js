import React from 'react'
import { useDispatch } from 'react-redux';
import { setCurrentDir } from '../../../store/ducks/files/actions';
import {FaFolder} from 'react-icons/fa'
import {BsThreeDots} from 'react-icons/bs'
import { useState } from 'react';
import OptionsDropdown from '../../UI/OptionsDropdown/OptionsDropdown';
import DropdownItem from '../../UI/OptionsDropdown/DropdownItem';
import { downloadFile } from '../../../services/FilesService';
import RenameFileInput from '../../RenameFileInput.js/RenameFileInput';

const GridItemOptionsDropdown = ({file}) => {
    const [showDropdown, setShowDropdown] = useState(true)

    const handleDownloadClick = (e, file) => {
        e.stopPropagation()
        downloadFile(file)
    }

    return(
        <div className='w-[25px] h-[25px] rounded-full hover:bg-slate-300 text-[#363636] absolute bottom-1 right-1 flex items-center justify-center cursor-pointer'>
            <BsThreeDots size={20} color={'#363636'} />
            <OptionsDropdown>
                {file.type !== 'dir' ? (
                    <>
                        <DropdownItem>Rename file</DropdownItem>
                        <DropdownItem onClick={(e) => handleDownloadClick(e, file)}>Download file</DropdownItem>
                    </>
                ) : (
                    <DropdownItem>Rename folder</DropdownItem>
                )}
            </OptionsDropdown>
        </div>
    )
}

const FilesGridItem = ({file}) => {
    const [active, setActive] = useState(false)
    const dispatch = useDispatch()
    const handleDoubleClick = (e, id) => {
        setActive(true)
        if (e.detail === 2) {
            dispatch(setCurrentDir(id))
        }
    };

  return (
    <div 
        className={`w-full h-[200px] rounded-md flex flex-col items-center justify-center bg-white p-5 border-[5px] border-transparent hover:shadow-lg transition-all duration-400 relative`}
        onClick={(e) => handleDoubleClick(e, file._id)}
        onMouseEnter = {() => setActive(true)}
        onMouseLeave = {() => setActive(false)}
    >
        <FaFolder size={100} color={'#36a1ea'}/>
        {/* <RenameFileInput file={file} colSpan={2} /> */}
        {file.name}
        {active ? (
            <GridItemOptionsDropdown file={file} />
        ): null}
    </div>
  )
}

export default FilesGridItem