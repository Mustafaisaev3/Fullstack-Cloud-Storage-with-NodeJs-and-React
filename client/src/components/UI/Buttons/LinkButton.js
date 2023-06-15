import React from 'react'
import { BiLinkAlt } from 'react-icons/bi'
import { useUI } from '../../../context/ui.context'

const LinkButton = ({file}) => {
    const { openModal, setModalView, setModalData } = useUI()
    const handleDownloadLinkBtnClick = () => {
        setModalData(file)
        setModalView('DOWNLOAD_LINK_MODAL_VIEW')
        openModal()
    }
  return (
    <div onClick={handleDownloadLinkBtnClick} className='w-[30px] h-[30px] flex items-center justify-center bg-[#6ffdff] text-black text-center p-1 rounded-md cursor-pointer'>
        <BiLinkAlt size={20} color={'black'}/>
    </div>
  )
}

export default LinkButton