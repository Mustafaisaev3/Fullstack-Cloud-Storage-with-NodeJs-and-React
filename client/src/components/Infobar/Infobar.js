import React from 'react'
import FileInfo from './FileInfo'

// Icons
import { BsFillFileEarmarkMusicFill, BsFillFileEarmarkTextFill } from 'react-icons/bs'
import { FaFileImage, FaRegFileImage } from 'react-icons/fa'
import { RiFileTextFill } from 'react-icons/ri'
import { MdInsertDriveFile } from 'react-icons/md'
import { AiOutlineCloudUpload } from 'react-icons/ai'

const Infobar = () => {
  return (
    <div className='w-[400px] h-screen fixed top-0 right-0 bg-[#f4f8f9]'>
        <div className='w-full h-full flex flex-col p-[50px] rounded-l-2xl bg-white'>
            <div className='w-full h-auto flex items-center justify-center'>
                <h2 className='text-2xl'>Storage Information</h2>
            </div>
            <div className='w-full py-10 border-b-[1px]'>
                <div className='flex w-full items-center justify-between mb-2'>
                    <div>45 Gb</div>
                    <div>100 Gb</div>
                </div>
                <div className='w-full h-[7px] border rounded-lg'>
                    <div className='w-[70%] h-[7px] bg-[#15b0bd] rounded-lg'></div>
                </div>
            </div>
            <div className='py-10 grow'>
                <FileInfo title={'Media files'} space={120} fileSpace={30} color={'#1a90a9'} icon={<BsFillFileEarmarkMusicFill size={25} color={'#1a90a9'} />} />
                <FileInfo title={'Images'} space={120} fileSpace={50}  color={'#1ac03e'} icon={<FaRegFileImage size={25} color={'#1ac03e'} />} />
                <FileInfo title={'Documents'} space={120} fileSpace={40} color={'#fcce44'} icon={<BsFillFileEarmarkTextFill size={25} color={'#fcce44'} />} />
                <FileInfo title={'Other Files'} space={120} fileSpace={80} color={'#9b45ed'} icon={<MdInsertDriveFile size={25} color={'#9b45ed'} />} />
                <FileInfo title={'Unknown Files'} space={120} fileSpace={65} color={'#7e93ac'} icon={<MdInsertDriveFile size={25} color={'#7e93ac'} />} />
            </div>
            <div className='w-full h-auto'>
                <div className='w-full h-[150px] flex flex-col items-center justify-center rounded-xl border-[#7c8d96] border-[2px] border-dashed'>
                    <div className='text-xl pb-2'>Upload File</div>
                    <AiOutlineCloudUpload size={60} color={'#7c8d96'} />
                </div>
            </div>
        </div>
    </div>
  )
}

export default Infobar