import React from 'react'
import { Portal } from 'react-portal'
import { IoMdClose } from 'react-icons/io'
import CircularProgressBar from '../CircularProgressBar'
import { selectUploadFiles } from '../../store/ducks/uploads/selectors'
import { useDispatch, useSelector } from 'react-redux'
import { removeUploadFile } from '../../store/ducks/uploads/actions'

const Uploader = ({open, closeUploader}) => {
  const dispatch = useDispatch()
  const uploadFiles = useSelector(selectUploadFiles)


  return (
    <Portal>
        {open &&  <div className='fixed bottom-0 right-0 p-5'>
                      <div className='p-5 w-[400px] h-[400px] flex flex-col rounded-lg bg-[#2ba7ff] overflow-hidden'>
                          <div className='flex justify-between items-center'>
                            <div className='text-[25px] text-white font-bold '>Download</div>
                            <div className='cursor-pointer' onClick={closeUploader}><IoMdClose size={30} color={'white'}/></div>
                          </div>
                          <div className='grow overflow-y-scroll'>
                            {uploadFiles && uploadFiles.map((file) => {
                                return <div className='w-full h-[50px] px-2 border border-white flex items-center justify-between mt-3 rounded-lg'>
                                    <div className='text-white'>{file.name}</div>
                                    <div className='flex items-center'>
                                        <CircularProgressBar progress={file.progress} radius={15} text_size={10} />
                                        <div className='pr-3 cursor-pointer' onClick={() => dispatch(removeUploadFile(file))}><IoMdClose size={15} color={'white'}/></div>
                                    </div>
                                </div>

                            })}
                            {/* <div className='w-full h-[50px] px-2 border border-white flex items-center justify-between mt-3 rounded-lg'>
                                <div className='text-white'>File name</div>
                                <CircularProgressBar progress={50} radius={15} text_size={10} />
                            </div>
                            <div className='w-full h-[50px] px-2 border border-white flex items-center justify-between mt-3 rounded-lg'>
                                <div className='text-white'>File name</div>
                                <CircularProgressBar progress={40} radius={15} text_size={10} />
                            </div>
                            <div className='w-full h-[50px] px-2 border border-white flex items-center justify-between mt-3 rounded-lg'>
                                <div className='text-white'>File name</div>
                                <CircularProgressBar progress={70} radius={15} text_size={10} />
                            </div>
                            <div className='w-full h-[50px] px-2 border border-white flex items-center justify-between mt-3 rounded-lg'>
                                <div className='text-white'>File name</div>
                                <CircularProgressBar progress={70} radius={15} text_size={10} />
                            </div>
                            <div className='w-full h-[50px] px-2 border border-white flex items-center justify-between mt-3 rounded-lg'>
                                <div className='text-white'>File name</div>
                                <CircularProgressBar progress={70} radius={15} text_size={10} />
                            </div>
                            <div className='w-full h-[50px] px-2 border border-white flex items-center justify-between mt-3 rounded-lg'>
                                <div className='text-white'>File name</div>
                                <CircularProgressBar progress={70} radius={15} text_size={10} />
                            </div>
                            <div className='w-full h-[50px] px-2 border border-white flex items-center justify-between mt-3 rounded-lg'>
                                <div className='text-white'>File name</div>
                                <CircularProgressBar progress={70} radius={15} text_size={10} />
                            </div> */}

                          </div>
                      </div>
                  </div>
        }
    </Portal>
  )
}

export default Uploader