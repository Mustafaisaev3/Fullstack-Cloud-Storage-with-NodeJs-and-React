import React from 'react'
import { useHistory, useParams } from 'react-router-dom'
import { BsImageFill } from 'react-icons/bs'
import { MdError } from 'react-icons/md'
import { useState, useLayoutEffect } from 'react'
import { downloadFileInfo ,downloadFileByToken } from '../../services/FilesService'
import PuffLoader from "react-spinners/PuffLoader";
import { selectFileIcon } from '../../hooks/useFileIcon'

const Download = () => {
  const history = useHistory()
  const { token } = useParams()
  const [file, setFile] = useState()
  const [status, setStatus] = useState()
  const [loading, setLoading] = useState(false)
  
  useLayoutEffect(() => {
    setLoading(true)

    const getFileInfo = async () => {
        const { status, data } = await downloadFileInfo(token)
        console.log(status)
        setFile(data)
        setStatus(status)
        setLoading(false)
    }

    getFileInfo()

    console.log(token)

  }, [token, status])

  const handleDownloadFile = async () => {
    await downloadFileByToken(token, file)
  }

  const handleGoHomeClick = () => {
    history.push('/')
  }

  if (loading) {
    return (
        <div className='w-full h-screen flex items-center justify-center'>
            <PuffLoader color='#36a1ea' size={100} />
        </div>
    )
  }

  if (status === 'error') {
    return (
        <div className='w-full h-screen bg-[#e3f2f5] relative flex flex-col items-center justify-center gap-4'>
            <MdError size={200} color='#36a1ea' />
            <div className='text-[50px]'>Invalid download link!</div>
            <div className='w-[150px] h-[50px] flex items-center justify-center rounded-md bg-white' onClick={handleGoHomeClick}>Home</div>
        </div>
      )
  }

    return (
        <div className='w-full h-screen bg-[#e3f2f5] relative'>
            <div className='header w-full h-auto p-[40px] flex items-center justify-between absolute left-0 top-0'>
                <div className='w-[70px] h-[70px] flex items-center justify-center cursor-pointer p-3 bg-white rounded-xl'>
                    <img src='/assets/logo.png' alt='logo' />
                </div>
                <div className='flex items-center gap-4'>
                    <div className='w-[100px] h-[50px] flex items-center justify-center rounded-md bg-[#6deeff]'>login</div>
                    <div className='w-[100px] h-[50px] flex items-center justify-center rounded-md bg-[#6dffe4]'>register</div>
                </div>
            </div>

            <div className='body w-full h-full flex items-center justify-center'>
                <div className='w-[1000px] h-[600px] rounded-lg bg-white border-[3px] border-[#41c3ff]'>
                    {file ? (
                        <div className='w-full h-full flex flex-col items-center'>
                            <div className='flex-1 flex items-center justify-center'>
                                {/* <BsImageFill size={200} color={'#36a1ea'} /> */}
                                {selectFileIcon(file.type, 200)}
                            </div> 
                            <div className='w-full h-[60px] bg-[#41c3ff] flex justify-between items-center px-5'>
                                <div className='flex items-end justify-center gap-2'>
                                    <div className='text-white text-[18px]'>{file.name}</div>
                                    <span className='text-[#e6e5e5] text-[15px]'>{file.size / 1000} KB</span>
                                </div>
                                <div className='w-[150px] h-[50px] flex items-center justify-center rounded-md bg-white' onClick={handleDownloadFile}>download</div>
                            </div>
                        </div>

                    ) : null}
                </div>
            </div>
        </div>
    )

}

export default Download