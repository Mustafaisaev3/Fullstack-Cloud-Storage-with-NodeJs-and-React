import React from 'react'

const DropdownItem = ({children, ...props}) => {
  return (
    <div className='px-3 py-2 cursor-pointer text-white hover:bg-white hover:text-[#2ba7ff] ' {...props}>
        {children}
    </div>
  )
}

export default DropdownItem