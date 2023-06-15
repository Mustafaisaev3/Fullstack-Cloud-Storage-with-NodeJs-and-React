import React from 'react'
import { useDispatch } from 'react-redux';
import { useHistory } from 'react-router-dom'
import { setCurrentDir } from '../../../store/ducks/files/actions';
import {FaFolder} from 'react-icons/fa'
import { BiLinkAlt } from 'react-icons/bi'
import { MdDriveFileRenameOutline } from 'react-icons/md'
import { HiDownload } from 'react-icons/hi'
import {BsThreeDots} from 'react-icons/bs'
import { useState } from 'react';
import OptionsDropdown from '../../UI/OptionsDropdown/OptionsDropdown';
import DropdownItem from '../../UI/OptionsDropdown/DropdownItem';
import { downloadFile } from '../../../services/FilesService';
import RenameFileInput from '../../RenameFileInput.js/RenameFileInput';
import { selectFileIcon } from '../../../hooks/useFileIcon';
import { useUI } from '../../../context/ui.context';

const GridItemOptionsDropdown = ({file}) => {
    const { openModal, setModalView, setModalData } = useUI()
    const [showDropdown, setShowDropdown] = useState(true)

    const handleDownloadLinkBtnClick = () => {
        setModalData(file)
        setModalView('DOWNLOAD_LINK_MODAL_VIEW')
        openModal()
    }

    const handleDownloadClick = (e, file) => {
        e.stopPropagation()
        downloadFile(file)
    }

    return(
        <div className='w-[25px] h-[25px] rounded-full hover:bg-slate-300 text-[#363636] absolute top-1 right-1 flex items-center justify-center cursor-pointer'>
            <BsThreeDots size={20} color={'#363636'} />
            <OptionsDropdown>
                {file.type !== 'dir' ? (
                    <>
                        <DropdownItem icon={<MdDriveFileRenameOutline ize={15} />}>Rename file</DropdownItem>
                        <DropdownItem icon={<HiDownload size={15} />} onClick={(e) => handleDownloadClick(e, file)}>Download file</DropdownItem>
                        <DropdownItem icon={<BiLinkAlt size={15} />} onClick={handleDownloadLinkBtnClick}>Download Link</DropdownItem>
                    </>
                ) : (
                    <DropdownItem icon={<MdDriveFileRenameOutline ize={15} />}>Rename folder</DropdownItem>
                )}
            </OptionsDropdown>
        </div>
    )
}

const FilesGridItem = ({file}) => {
    const [active, setActive] = useState(false)
    const history = useHistory()
    const dispatch = useDispatch()
    const handleDoubleClick = (e, file) => {
        setActive(true)
        if (e.detail === 2 && file.type === 'dir') {
            dispatch(setCurrentDir(file._id))
            history.push(`/files/${file._id}`)
        }
    };

  return (
    <div 
        className={`w-full h-[200px] rounded-md flex flex-col items-center justify-center bg-white p-5 border-[5px] border-transparent hover:shadow-lg transition-all duration-400 relative`}
        onClick={(e) => handleDoubleClick(e, file)}
        onMouseEnter = {() => setActive(true)}
        onMouseLeave = {() => setActive(false)}
    >
        {selectFileIcon(file.type, 100)}
        {/* <FaFolder size={100} color={'#36a1ea'}/> */}
        <div className='w-full mt-5 overflow-x-hidden relative'>
            <h2 className='w-full text-center block overflow-hidden truncate'>{file.name}</h2>
            {/* <div className='w-full h-auto text-center bg-white absolute top-0 left-0'>
                {file.name}
            </div> */}
        </div>
        {active ? (
            <GridItemOptionsDropdown file={file} />
        ): null}
    </div>
  )
}

export default FilesGridItem