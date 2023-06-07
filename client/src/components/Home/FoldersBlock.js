import React, { useState } from 'react'
import { useSelector, useDispatch } from 'react-redux'
import Card from '../UI/Card/Card'
import OptionsDropdown from '../UI/OptionsDropdown/OptionsDropdown'
import DropdownItem from '../UI/OptionsDropdown/DropdownItem'
import { selectFiles, selectAllFiles } from '../../store/ducks/files/selectors'
import { setAllFiles } from '../../store/ducks/files/actions'
import { useUI } from '../../context/ui.context'

// Icons
import { FaFolder } from'react-icons/fa'
import { useLayoutEffect } from 'react'

const FoldersBlock = () => {
  const dispatch = useDispatch()
  const {openModal, setModalView, setModalData} = useUI()

  const [activeFolder, setActiveFolder] = useState(null)

  useLayoutEffect(() => {
    dispatch(setAllFiles())
  }, [])

  const files = useSelector(selectAllFiles)
//   const files = useSelector(selectFiles)

  const openFolderBtnClick = (e, file) => {
    setActiveFolder(file._id)

    if (e.detail === 2) {
        setModalView('FOLDER_MODAL_VIEW')
        setModalData(file)
        openModal()
    }
  };

  return (
    <div className='w-full py-10'>
        <div className='flex items-center justify-between pb-5'>
            <div className='text-2xl font-bold text-[#8997a1]'>Folders</div>
            <OptionsDropdown>
                <DropdownItem onClick={openModal}>Add folder</DropdownItem>
                <DropdownItem onClick={openModal}>Add folder</DropdownItem>
                <DropdownItem onClick={openModal}>Add folder</DropdownItem>
                <DropdownItem onClick={openModal}>Add folder</DropdownItem>
            </OptionsDropdown>
        </div> 
        <div className='flex gap-4'>
            <div className='flex gap-4 overflow-x-scroll pb-4'>
                {files && files.map((file) => {
                    if (file.type === 'dir') {
                        return  <Card classes={`bg-[white] p-2 min-w-[200px] cursor-pointer border-[1px] ${file._id === activeFolder ? 'border-[#36a1ea]' : 'border-transparent'}`} onClick={(e) => openFolderBtnClick(e,file)}>
                                    <div className='w-full h-full flex flex-col items-center justify-center'>
                                        <FaFolder size={80} color={'#36a1ea'} />
                                        <div>{file.name}</div>
                                    </div>
                                </Card>
                    } else {
                        return null
                    }

                })}
                
            </div>
        </div>
    </div>
  )
}

export default FoldersBlock