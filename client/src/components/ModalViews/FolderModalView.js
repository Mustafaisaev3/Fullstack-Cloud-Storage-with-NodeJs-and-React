import React from 'react'
import { useState, useLayoutEffect } from 'react'
import { useUI } from '../../context/ui.context'
import { getFiles } from '../../services/FilesService'
import TableContainer from '../UI/Table/TableContainer'
import Table from '../UI/Table/Table'
import TableHeader from '../UI/Table/TableHeader'
import TableBody from '../UI/Table/TableBody'
import TableRow from '../UI/Table/TableRow'
import TableCell from '../UI/Table/TableCell'
import DeleteButton from '../UI/Buttons/DeleteButton'
import DownloadButton from '../UI/Buttons/DownloadButton'
import PuffLoader from "react-spinners/PuffLoader";
import { FaFolderOpen } from 'react-icons/fa'
import useFoldersNavigation from '../../hooks/useFoldersPagination'

// Icons
import { IoMdClose, IoIosArrowBack, IoIosArrowForward } from 'react-icons/io'
import { useEffect } from 'react'

const FolderModalView = () => {
  const { closeModal, modalData: {_id, name} } = useUI()
  const { currentData, prev, next, open, isNext, isPrev } = useFoldersNavigation(_id)

  const [loading, setLoading] = useState(false)
  const [files, setFiles] = useState()
  const [folderId, setFolderId] = useState(_id)
  
  const handleOpenFolderBtnClick = (e, file) => {
    if (e.detail === 2 && file.type === 'dir') {
        open(file._id)
        // setFolderId(file._id)
    }

    console.log(currentData)
  };
  
//   useLayoutEffect(() => {
//     setLoading(true)
//     const fetchFiles = async () => {
//         const filesData = await getFiles(folderId)
//         setFiles(filesData)
//         setLoading(false)
//     }

//     fetchFiles()
//   }, [folderId])

    useEffect(() => {
        console.log('rerender')
    }, [currentData])


  return (
    <div className='w-[700px] h-[500px] bg-white flex flex-col '>
        <div className='w-full p-[20px] flex items-center justify-between border-b-[1px]'>
            <div className='text-[#7c8d96] text-[30px]'>
                {name}
            </div>
            <div className='flex items-center gap-6'>
                <div className='flex gap-2'>
                    <div className='hover:bg-[#b0b0b03e] p-1 rounded-md cursor-pointer' onClick={prev}>
                        <IoIosArrowBack size={20} color={'#2ba7ff'} />
                    </div>
                    <div className='hover:bg-[#b0b0b03e] p-1 rounded-md cursor-pointer' onClick={next}>
                        <IoIosArrowForward size={20} color={'#2ba7ff'} />
                    </div>
                </div>
                <div className='cursor-pointer' onClick={() => closeModal()}>
                    <IoMdClose size={25} color={'#1d9bf0'}/>
                </div>
            </div>
        </div>
        <div className='grow overflow-hidden'>
            {loading
                ?
                <div className='w-full h-[100%] flex items-center justify-center text-[50px]'>
                    <PuffLoader color='#36a1ea' size={100} />
                </div>
                :
                (currentData?.length > 0
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
                                {currentData && currentData.map(file => {
                                return <TableRow columnNumber={6} onClick={(e) => handleOpenFolderBtnClick(e, file)}>
                                            {/* <RenameFileInput file={file} colSpan={2} /> */}
                                            <TableCell title={file.name} />
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
                    <div className='w-full h-[100%] flex flex-col items-center justify-center gap-4 text-[30px]'>
                        <FaFolderOpen className='text-[150px] text-[#7c8d96]' />
                        <h2>Folder is empty!</h2>
                    </div>
                )
            }
            
        </div>
    </div>
  )
}

export default FolderModalView