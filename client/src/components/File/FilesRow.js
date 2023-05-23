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
import TableFooter from '../UI/Table/TableFooter'
import Pagination from '../UI/Pagination/Pagination'
import { useDispatch } from 'react-redux'
import { useHistory } from 'react-router-dom'
import { setCurrentDir } from '../../store/ducks/files/actions';

const FilesRow = ({files, pagination}) => {
//   const { prev, next, currentData } = usePagination(files)
const dispatch = useDispatch()
const history = useHistory()
const handleDoubleClick = (e, file) => {
    if (e.detail === 2 && file.type === 'dir') {
        dispatch(setCurrentDir(file._id))
        history.push(`/files/${file._id}`)
    }
};
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
                return <TableRow columnNumber={6} onClick={(e) => handleDoubleClick(e, file)}>
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
            <TableFooter>
                <TableRow columnNumber={2} className='flex justify-between'>
                    <div>sss</div>
                    <div className='p-2'>
                        <Pagination pagination={pagination} />
                    </div>
                </TableRow>
            </TableFooter>
        </Table>
    </TableContainer>
  )
}

export default FilesRow