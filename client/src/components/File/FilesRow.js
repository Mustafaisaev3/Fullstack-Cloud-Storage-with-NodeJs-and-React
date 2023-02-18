import React from 'react'
import TableContainer from '../UI/Table/TableContainer'
import Table from '../UI/Table/Table'
import TableHeader from '../UI/Table/TableHeader'
import TableRow from '../UI/Table/TableRow'
import TableCell from '../UI/Table/TableCell'
import TableBody from '../UI/Table/TableBody'
import DeleteButton from '../UI/Buttons/DeleteButton'
import DownloadButton from '../UI/Buttons/DownloadButton'
import { selectFileIcon } from '../../hooks/useFileIcon'

const FilesRow = ({files}) => {
  return (
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
  )
}

export default FilesRow