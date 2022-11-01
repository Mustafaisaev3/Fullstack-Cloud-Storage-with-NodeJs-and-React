import React from 'react'

const TableHeader = ({children}) => {
  return (
    <div className='w-full h-[40px] text-[#7c8d96] font-bold'>
        {children}
    </div>
  )
}

export default TableHeader