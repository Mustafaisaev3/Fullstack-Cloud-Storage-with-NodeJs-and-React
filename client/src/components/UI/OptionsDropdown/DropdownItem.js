import React from 'react'

const DropdownItem = ({children, icon, ...props}) => {
  return (
    <div className='flex items-center gap-1 px-1 py-1 rounded-md text-[13px] cursor-pointer text-white hover:bg-white hover:text-[#2ba7ff] ' {...props}>
      {icon && icon}
      <div>{children}</div>
    </div>
  )
}

export default DropdownItem