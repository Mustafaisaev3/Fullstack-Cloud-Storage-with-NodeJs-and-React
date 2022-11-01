import React from 'react'
import { useDispatch } from 'react-redux'
import StorageCard from '../components/StorageCard'
import QuickAccessBlock from '../components/Home/QuickAccessBlock'
import TableContainer from '../components/UI/Table/TableContainer'
import Table from '../components/UI/Table/Table'
import TableHeader from '../components/UI/Table/TableHeader'
import TableRow from '../components/UI/Table/TableRow'
import TableCell from '../components/UI/Table/TableCell'
import TableBody from '../components/UI/Table/TableBody'
import { useStorageComponent } from '../hooks/useStorages'


const Home = () => {
  const dispatch = useDispatch()
  const {storages} = useStorageComponent()

  return (
        // <div className='border p-3 rounder-md cursor-pointer' onClick={() => dispatch(LogoutUser())}>Logout</div>
    <div className='flex flex-col h-full py-5  '>
        <div className='flex items-center pt-5 gap-8'>
            <StorageCard storageName={'DropBox'} />
            <StorageCard storageName={'GoogleDrive'} />
            <StorageCard storageName={'OneDrive'} />
        </div>
        <QuickAccessBlock />
        <div className='grow overflow-y-hidden'>
            <TableContainer>
                <Table>
                    <TableHeader>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} />
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                                                                                                     
                        </TableRow>
                    </TableHeader>
                    <TableBody>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['DropBox']} />
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                            
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['GoogleDrive']}/>
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                          
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['OneDrive']}/>
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                           
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['DropBox']} />
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                            
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['GoogleDrive']}/>
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                          
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['OneDrive']}/>
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                           
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['DropBox']} />
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                            
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['GoogleDrive']}/>
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                          
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['OneDrive']}/>
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                           
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['DropBox']} />
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                            
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['GoogleDrive']}/>
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                          
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['OneDrive']}/>
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                           
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['GoogleDrive']}/>
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                          
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['OneDrive']}/>
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                           
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['GoogleDrive']}/>
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                          
                        </TableRow>
                        <TableRow columnNumber={5}>
                            <TableCell title={'Name'} colSpan={2} icon={storages['OneDrive']}/>
                            <TableCell title={'File item'} />
                            <TableCell title={'Lust Modified'} />
                            <TableCell title={'File size'} />                                           
                        </TableRow>
                    </TableBody>
                </Table>
            </TableContainer>
        </div>
    </div>
  )
}

export default Home