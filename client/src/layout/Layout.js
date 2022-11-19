import React from 'react'
import Infobar from '../components/Infobar/Infobar'
import Sidebar from '../components/Sidebar/Sidebar'
import Topbar from '../components/Topbar/Topbar'
import ManagedUploader from '../components/Uploader/ManagedUploader'

const Layout = ({children}) => {
  return (
    <div className='bg-[#36a1ea]'>
        <Sidebar />
        <div className='h-screen bg-[#e3f2f5] ml-[100px] mr-[400px] rounded-l-2xl p-[50px]'>
        {/* <div className='h-screen bg-[#f4f8f9] ml-[100px] mr-[400px] rounded-l-2xl p-[50px]'> */}
            <Topbar />
            {children}
        </div>
        <Infobar />
        <ManagedUploader />
    </div>
  )
}

export default Layout