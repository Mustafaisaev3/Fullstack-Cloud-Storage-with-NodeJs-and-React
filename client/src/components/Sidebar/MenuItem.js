import React from 'react'

const MenuItem = ({children, active}) => {
  return (
    <div className={`w-full p-3 rounded-xl cursor-pointer ${active ? 'bg-[#64baf5]' : ''} hover:bg-[#64bbf566]`}>
        {children}
    </div>
  )
}

export default MenuItem