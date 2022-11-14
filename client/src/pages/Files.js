import React, { useEffect, useState } from 'react'

import TableContainer from '../components/UI/Table/TableContainer'
import Table from '../components/UI/Table/Table'
import TableHeader from '../components/UI/Table/TableHeader'
import TableRow from '../components/UI/Table/TableRow'
import TableCell from '../components/UI/Table/TableCell'
import TableBody from '../components/UI/Table/TableBody'
import { useStorageComponent } from '../hooks/useStorages'

import { TiArrowSortedDown } from 'react-icons/ti'
import { HiDownload } from 'react-icons/hi'
import { MdDeleteForever } from 'react-icons/md'
import { FaFolder } from 'react-icons/fa'
import FolderParent from '../components/FolderTree/FolderParent'
import { downloadFile, getFile, getFiles } from '../services/FilesService'
import { useDispatch, useSelector } from 'react-redux'
import { selectCurrentDir, selectFiles, selectAllFiles } from '../store/ducks/files/selectors'
import FolderStructure from '../components/FolderTree/FolderStructure'
import { setFiles, setAllFiles } from '../store/ducks/files/actions'

const Files = () => {
  // const [files, setFiles] = useState()
  const {storages} = useStorageComponent()
  const currentDir = useSelector(selectCurrentDir)
  const filesTree = useSelector(selectAllFiles)
  const files = useSelector(selectFiles)
  const dispatch = useDispatch()

  useEffect(() => {
    dispatch(setAllFiles())
  }, [])

  useEffect(() => {
    dispatch(setFiles(currentDir))
  }, [currentDir])

  console.log(files)

  const handleDownloadClick = (e, file) => {
    e.stopPropagation()
    console.log(file)
    downloadFile(file)
  }

  // const getFileFunck = async () => {
  //   const response = await getFile('636dea604e46fd5b210fced1').then(res => res.data)
  //   console.log(response)
  // }
  // getFileFunck()

  return (
    <div className='flex w-full h-screen font-bold py-5 '>
      <div className='w-full'>
        <div className='text-2xl text-[#8997a1]'>Files</div>
        <div className='w-full flex pt-5'>

          <div className='w-[600px] h-full overflow-hidden'>
            <div>MY FOLDERS</div>
            <div>

              {/* <ul className='w-full h-auto'>
                <li className='py-2'>
                  <div className='flex items-center pb-2'>
                    <TiArrowSortedDown size={20} color={'#000'} className={`${active ? '-rotate-45' : '-rotate-90'} cursor-pointer`} onClick={() => setActive(!active)} />
                    <div className='flex items-center pl-3'>
                      <FaFolder size={25} color={'#36a1ea'} />
                      <div className='pl-2'>New Folder</div>
                    </div>
                  </div>

                    {active && 
                      <div className='pl-5'>
                        <ul className='w-full h-auto'>
                          <li className='flex items-center py-2'>
                            <TiArrowSortedDown size={20} color={'#000'} className={`${active ? '-rotate-45' : '-rotate-90'} cursor-pointer`} onClick={() => setActive(!active)} />
                            <div className='flex items-center pl-3'>
                              <FaFolder size={25} color={'#36a1ea'} />
                              <div className='pl-2'>New Folder</div>
                            </div>
                          </li>
                          <li className='flex items-center py-2'>
                            <TiArrowSortedDown size={20} color={'#000'} className={`${active ? '-rotate-45' : '-rotate-90'} cursor-pointer`} onClick={() => setActive(!active)} />
                            <div className='flex items-center pl-3'>
                              <FaFolder size={25} color={'#36a1ea'} />
                              <div className='pl-2'>New Folder</div>
                            </div>
                          </li>
                          <li className='flex items-center py-2'>
                            <TiArrowSortedDown size={20} color={'#000'} className={`${active ? '-rotate-45' : '-rotate-90'} cursor-pointer`} onClick={() => setActive(!active)} />
                            <div className='flex items-center pl-3'>
                              <FaFolder size={25} color={'#36a1ea'} />
                              <div className='pl-2'>New Folder</div>
                            </div>
                          </li>
                          <li className='flex items-center py-2'>
                            <TiArrowSortedDown size={20} color={'#000'} className={`${active ? '-rotate-45' : '-rotate-90'} cursor-pointer`} onClick={() => setActive(!active)} />
                            <div className='flex items-center pl-3'>
                              <FaFolder size={25} color={'#36a1ea'} />
                              <div className='pl-2'>New Folder</div>
                            </div>
                          </li>
                        </ul>
                      </div>
                    }
                </li>
              </ul> */}
              {filesTree && filesTree.map(node => {
                return <FolderStructure _id={node._id} {...node} />
              })}
              
            </div>
          </div>


          <div className='grow h-fit pl-[30px]'>
            <div>DOCUMENTS</div>
              {files && files.length 
                ?
                <TableContainer>
                  <Table>
                      <TableHeader>
                          <TableRow columnNumber={6}>
                              <TableCell title={'Name'} colSpan={2} />
                              <TableCell title={'File item'} />
                              <TableCell title={'Lust Modified'} />
                              <TableCell title={'File size'} />                                                                                                                     
                              <TableCell />                                                                                                                     
                          </TableRow>
                      </TableHeader>
                      <TableBody>
                          {files && files.map(file => {
                            return <TableRow columnNumber={6}>
                                      <TableCell title={file.name} colSpan={2} icon={storages['DropBox']} />
                                      <TableCell title={'File item'} />
                                      <TableCell title={'Lust Modified'} />
                                      <TableCell title={'File size'} />                                                                                      
                                      <TableCell>
                                        <div className='w-full h-full flex gap-2'>
                                          {/* <div className='w-[60px] bg-[#f55] text-white text-center p-1 rounded-lg'>delete</div> */}
                                          <div className='w-[30px] h-[30px] flex items-center justify-center bg-[#ff6f6f] text-black text-center p-1 rounded-md cursor-pointer'><MdDeleteForever size={20} color={'black'}/></div>
                                          {file.type !== 'dir' && 
                                            <div className='w-[30px] h-[30px] flex items-center justify-center bg-[#12be2fc7] text-black text-center p-1 rounded-md cursor-pointer' onClick={(e) => handleDownloadClick(e, file)}><HiDownload size={20} color={'black'}/></div>
                                          }
                                        </div>  
                                      </TableCell>                                            
                                  </TableRow>
                          })}
                      </TableBody>
                  </Table>
                </TableContainer>
                :
                <div>Folder Empty</div>
              }
                
          </div>
        </div>
      </div>
    </div>
  )
}

export default Files