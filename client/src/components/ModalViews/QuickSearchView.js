import React, { useState, useEffect, useLayoutEffect } from 'react'

import TableContainer from '../UI/Table/TableContainer'
import Table from '../UI/Table/Table'
import TableHeader from '../UI/Table/TableHeader'
import TableRow from '../UI/Table/TableRow'
import TableCell from '../UI/Table/TableCell'
import TableBody from '../UI/Table/TableBody'

import Card from '../UI/Card/Card'


// Icons
import { BiImage } from'react-icons/bi'
import { BsFileEarmarkZip } from'react-icons/bs'
import { FiYoutube, FiDownload } from'react-icons/fi'
import { SiApplemusic } from'react-icons/si'
import { HiDocument } from'react-icons/hi'
import { IoMdClose } from'react-icons/io'
import { quickAccessItems } from '../../utils/quick-access-items'
import { useDispatch, useSelector } from 'react-redux'
import { selectFiles, selectAllFiles } from '../../store/ducks/files/selectors'
import { setAllFiles } from '../../store/ducks/files/actions'
import DeleteButton from '../UI/Buttons/DeleteButton'
import DownloadButton from '../UI/Buttons/DownloadButton'
import { useUI } from '../../context/ui.context'
import RenameFileInput from '../RenameFileInput.js/RenameFileInput'


const QuickSearchView = () => {
  const {closeModal, modalData} = useUI()
  const dispatch = useDispatch() 
  const allfiles = useSelector(selectAllFiles)
  const [files, setFiles] = useState([])


  const [activeFile, setActiveFile] = useState(modalData)

  const handleQuickAccessItemClick = (item) => {
    setActiveFile(item)
  }

  useLayoutEffect(() => {
    let filteredFiles = []
    allfiles.map(file => {
        if(file.type !== 'dir' && activeFile.fileTypes.includes(file.type)){
            filteredFiles.push(file)
            console.log(file)
        }
    })
    setFiles(filteredFiles)
  }, [activeFile, allfiles])

  useEffect(() => {
    dispatch(setAllFiles())
  }, [])



  return (
    <div className='w-[700px] h-[500px] bg-white flex flex-col '>
        <div className='w-full p-[20px] flex items-center justify-between border-b-[1px]'>
            <div className='text-[#7c8d96] text-[30px]'>
                Quick Access
            </div>
            <div className='cursor-pointer' onClick={() => closeModal()}>
                <IoMdClose size={25} color={'#1d9bf0'}/>
            </div>
        </div>
        <div className='flex gap-4 m-5 my-3'>
            {quickAccessItems.map((item) => {
                return  <div className=''>
                            <Card classes={`bg-[white] cursor-pointer border-[2px] border-white ${activeFile.type === item.type ? 'border-[#5cadff]' : ''}`} onClick={() => handleQuickAccessItemClick(item)}>
                                <div className='w-full h-full flex items-center justify-center'>
                                    {item.iconData}
                                </div>
                            </Card>
                        </div>
            })}
        </div>
        <div className='grow overflow-hidden'>
            {files.length
                ?
                <TableContainer>
                    <Table>
                        <TableHeader>
                            <TableRow columnNumber={6}>
                                <TableCell title={'Name'} colSpan={2} />
                                <TableCell title={'File type'} />
                                <TableCell title={'Lust Modified'} className={'justify-center'} />
                                <TableCell title={'File size'} className={'justify-center'} />                                                                                                                     
                                <TableCell />                                                                                                                     
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {files && files.map(file => {
                            return <TableRow columnNumber={6}>
                                        <RenameFileInput file={file} colSpan={2} />
                                        <TableCell title={file.type} />
                                        <TableCell title={file.date.slice(0,10)} className={'justify-center'} />
                                        <TableCell title={file.type === 'dir' ? '-' : file.size} className={'justify-center'}  />                                                                                      
                                        <TableCell>
                                        <div className='w-full h-full flex gap-2'>
                                            <DeleteButton file={file} />
                                            {file.type !== 'dir' && 
                                                <DownloadButton file={file} />
                                            }
                                        </div>  
                                        </TableCell>                                            
                                    </TableRow>
                            })}
                        </TableBody>
                    </Table>
                </TableContainer>
                :
                <div className='w-full h-[100%] flex items-center justify-center text-[50px]'>Files not Found</div>
            }
            
        </div>
    </div>
  )
}

export default QuickSearchView