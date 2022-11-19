import React from 'react'

const TableCell = ({children, title, icon, colSpan = 1, className}) => {
  return (
    <div className={`w-full px-3 flex items-center text-clipellipsis whitespace-nowrap overflow-hidden ${className}`} style={{'grid-column': `span ${colSpan}`}}>
        {icon && <div className='pr-3'>{icon}</div>}
        <div>{title}</div>
        <div>{children}</div>
    </div>
  )
}

export default TableCell
