import React from 'react'

const TableBody = ({children}) => {
  return (
    <div className='w-full h-full overflow-y-scroll'>
        {children}
    </div>
  )
}

export default TableBody