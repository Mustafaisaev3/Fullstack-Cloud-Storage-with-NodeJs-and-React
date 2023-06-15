import React from 'react'
import {IoMdClose} from 'react-icons/io'
import { BiLinkAlt } from 'react-icons/bi'
import { BsCheckLg } from 'react-icons/bs'
import { useDispatch } from 'react-redux'
import { useUI } from '../../context/ui.context'
import { selectFileIcon } from '../../hooks/useFileIcon'
import { selectCurrentDir } from '../../store/ducks/files/selectors'
import useCopyLink from '../../hooks/useCopyLink'
import Button from '../UI/Buttons/Button'

const DownloadLinkView = () => {
    const { closeModal, modalData: file } = useUI()
    const [isCopied, handleCopy] = useCopyLink()
    const downloadLink = `http://localhost:3000/download/${file.downloadToken}`

    const handleCopyLinkBtn = () => {
        handleCopy(downloadLink)
        console.log('copy')
    }

    if (!file.downloadToken) {
        return (
            <div className='w-[300px] h-[200px] bg-white rounded-md flex flex-col items-center justify-center gap-5'>
                <div className='text-[30px]'>No download link</div>
                <Button label={'Close'} btn_type='danger' onClick={closeModal} />
            </div>
        )
    }

    return (
        <div className='w-auto h-auto bg-white rounded-md'>
            <div className='w-full p-[15px] flex justify-between border-b-[1px]'>
                <div className='text-[#7c8d96] text-[20px]'>
                    Get download link
                </div>
                <div className='cursor-pointer' onClick={() => closeModal()}>
                    <IoMdClose size={25} color={'#1d9bf0'}/>
                </div>
            </div>
            <div className='p-[15px] w-[600px] h-[300] rounded-lg bg-white'>
                <div className='w-full h-auto pb-2 flex items-end gap-2'>
                    {selectFileIcon(file.type)}
                    <div>{file.name}</div>
                    <div className='text-[gray]'>{Math.round(file.size / 1000)} kb</div>
                </div>
                <div className='w-full h-[40px] border rounded-md my-4 overflow-hidden flex items-center'>
                    <div className='icon px-2'>
                        <BiLinkAlt size={20} color={'black'} />
                    </div>
                    <input value={downloadLink} type="text" className='grow h-full outline-none pr-2' placeholder='link' />
                    {isCopied ? (
                        <button className='w-[100px] h-full bg-[#2ba7ff] text-white flex items-center justify-center'>
                            <BsCheckLg size={15} color='white' />
                        </button>
                    ) : (
                        <button onClick={handleCopyLinkBtn} className='w-[100px] h-full bg-[#2ba7ff] text-white'>Copy</button>
                    )}
                </div>
            </div>
        </div>
    )
}

export default DownloadLinkView