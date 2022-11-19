import React, { useEffect, useState } from 'react'

import TableContainer from '../components/UI/Table/TableContainer'
import Table from '../components/UI/Table/Table'
import TableHeader from '../components/UI/Table/TableHeader'
import TableRow from '../components/UI/Table/TableRow'
import TableCell from '../components/UI/Table/TableCell'
import TableBody from '../components/UI/Table/TableBody'
import { useStorageComponent } from '../hooks/useStorages'
import { selectFileIcon } from '../hooks/useFileIcon'


import { TiArrowSortedDown } from 'react-icons/ti'
import { FaFolderOpen } from 'react-icons/fa'
import { BsFolder2Open } from 'react-icons/bs'
import { HiDownload } from 'react-icons/hi'
import { MdDeleteForever } from 'react-icons/md'
import { FaFolder } from 'react-icons/fa'
import FolderParent from '../components/FolderTree/FolderParent'
import { downloadFile, getFile, getFiles } from '../services/FilesService'
import { useDispatch, useSelector } from 'react-redux'
import { selectCurrentDir, selectFiles, selectAllFiles } from '../store/ducks/files/selectors'
import FolderStructure from '../components/FolderTree/FolderStructure'
import { setFiles, setAllFiles, deleteFile } from '../store/ducks/files/actions'
import DeleteButton from '../components/UI/Buttons/DeleteButton'
import DownloadButton from '../components/UI/Buttons/DownloadButton'


const Files = () => {
  // const [files, setFiles] = useState()
  const {storages} = useStorageComponent()
  const currentDir = useSelector(selectCurrentDir)
  const filesTree = useSelector(selectAllFiles)
  const files = useSelector(selectFiles)
  const dispatch = useDispatch()

  useEffect(() => {
    dispatch(setAllFiles())
  }, [files])

  useEffect(() => {
    dispatch(setFiles(currentDir))
  }, [currentDir])


  // const getFileFunck = async () => {
  //   const response = await getFile('636dea604e46fd5b210fced1').then(res => res.data)
  //   console.log(response)
  // }
  // getFileFunck()

  return (
    <div className='flex w-full h-full font-bold py-5 overflow-hidden'>
      <div className='w-full'>
        <div className='text-2xl text-[#8997a1]'>Files</div>
        <div className='w-full h-full flex pt-5'>

          <div className='w-[400px] h-full'>
            <div>MY FOLDERS</div>
            <div className='h-full overflow-y-scroll pb-3'>
              {filesTree && filesTree.map(node => {
                return <FolderStructure _id={node._id} {...node} />
              })}
            </div>
          </div>


          <div className='pl-[30px] pb-[50px] grow'>
            <div>DOCUMENTS</div>
              {files && files.length 
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
                                      <TableCell title={file.name} colSpan={2} icon={selectFileIcon(file.type)} />
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
                <div className='w-full h-full flex flex-col items-center justify-center'>
                  <BsFolder2Open size={300} color={'#696969b5'} />
                  <div className='text-[50px] text-[#696969b5] font-semibold pt-8'>This folder is empty</div>
                </div>
              }
                
          </div>
        </div>
      </div>
    </div>
  )
}

export default Files