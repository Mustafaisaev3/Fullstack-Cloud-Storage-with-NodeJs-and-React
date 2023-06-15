import React from 'react'
import TableContainer from '../UI/Table/TableContainer'
import Table from '../UI/Table/Table'
import TableHeader from '../UI/Table/TableHeader'
import TableRow from '../UI/Table/TableRow'
import TableCell from '../UI/Table/TableCell'
import TableBody from '../UI/Table/TableBody'
import DeleteButton from '../UI/Buttons/DeleteButton'
import DownloadButton from '../UI/Buttons/DownloadButton'
import LinkButton from '../UI/Buttons/LinkButton'
import { selectFileIcon } from '../../hooks/useFileIcon'

import { BiDotsVerticalRounded } from 'react-icons/bi'
import { useSelector } from 'react-redux'
import { selectAllFiles } from '../../store/ducks/files/selectors'

const RecentlyAdded = () => {
  const files = useSelector(selectAllFiles).filter(file => file.type !== 'dir').slice(0, 10)

  return (
    <div className='grow'>
        <div className='flex items-center justify-between pb-5'>
            <div className='text-2xl text-[#8997a1]'>Recently Added</div>
            <BiDotsVerticalRounded size={25} color={'#8997a1'} />
        </div>
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
                    {files.length > 0 && files.map(file => {
                    return <TableRow columnNumber={6} >
                                <TableCell title={file.name} colSpan={2} icon={selectFileIcon(file.type)} className={file.type === 'dir' ? 'cursor-pointer' : ''} />
                                <TableCell title={file.type} />
                                <TableCell title={file.date.slice(0,10)} className={'justify-center'} />
                                <TableCell title={file.type === 'dir' ? '-' : file.size} className={'justify-center'}  />                                                                                      
                                <TableCell>
                                <div className='w-full h-full flex gap-2'>
                                    <DeleteButton file={file} />
                                    {file.type !== 'dir' && (
                                        <>
                                            <DownloadButton file={file} />
                                            <LinkButton file={file} />
                                        </>
                                    )}
                                </div>  
                                </TableCell>                                            
                            </TableRow>
                    })}
                </TableBody>
            </Table>
        </TableContainer>
    </div>
  )
}

export default RecentlyAdded