import React from 'react'

const TableBody = ({children}) => {
  return (
    <div className='w-full h-full flex-1 overflow-y-scroll overflow-x-auto'>
        {children}
    </div>
  )
}

export default TableBody