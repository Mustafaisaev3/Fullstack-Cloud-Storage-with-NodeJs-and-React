import React, { useState } from 'react'
import Infobar from '../components/Infobar/Infobar'
import Sidebar from '../components/Sidebar/Sidebar'
import Topbar from '../components/Topbar/Topbar'
import ManagedUploader from '../components/Uploader/ManagedUploader'

const Layout = ({children}) => {
  const [showInfobar, setShowInfobar] = useState(false)

  return (
    <div className='w-screen h-screen bg-[#36a1ea] flex overflow-hidden'>
        <div className='w-[100px] h-screen bg-red-900'>

        </div>
        <div className='w-full h-full flex-1  bg-slate-500 overflow-y-scroll'>
            <div className='w-full h-[2000px]'></div>
        
        </div>
        <div className='w-[400px] h-screen bg-green-900'></div>
    </div>
  )
}

export default Layout