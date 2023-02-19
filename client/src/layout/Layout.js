import React, { useState } from 'react'
import Infobar from '../components/Infobar/Infobar'
import Sidebar from '../components/Sidebar/Sidebar'
import Topbar from '../components/Topbar/Topbar'
import ManagedUploader from '../components/Uploader/ManagedUploader'

const Layout = ({children}) => {
  const [showInfobar, setShowInfobar] = useState(false)

  return (
    <div className='w-screen h-screen bg-[#36a1ea] flex overflow-hidden'>
        <Sidebar />
        <div className='h-screen flex flex-col flex-1 bg-[#e3f2f5] rounded-l-2xl p-[20px] overflow-hidden'>
            <Topbar setShowInfobar={setShowInfobar} />
            {children}
        </div>
        {showInfobar ? <Infobar setShowInfobar={setShowInfobar} /> : null}
        <ManagedUploader />
    </div>
  )
}

export default Layout