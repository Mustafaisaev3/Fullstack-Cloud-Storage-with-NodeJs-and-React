import React from 'react'
import { downloadFile } from '../../../services/FilesService'
import { HiDownload } from 'react-icons/hi'

const DownloadButton = ({file}) => {
    
    const handleDownloadClick = (e, file) => {
        e.stopPropagation()
        downloadFile(file)
    }

    return (
        <div className='w-[30px] h-[30px] flex items-center justify-center bg-[#12be2fc7] text-black text-center p-1 rounded-md cursor-pointer' onClick={(e) => handleDownloadClick(e, file)}>
            <HiDownload size={20} color={'black'}/>
        </div>
    )
}

export default DownloadButton