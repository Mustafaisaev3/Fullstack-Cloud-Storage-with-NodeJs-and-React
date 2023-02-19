import React from 'react'

const TableRow = ({children, columnNumber, ...rest}) => {
  return (
    <div className={`w-full h-[60px] items-center grid grid-cols-${children.length} border-b-[1px] hover:shadow-xl`} style={{'grid-template-columns': `repeat(${columnNumber ? columnNumber : children.length}, minmax(0, 1fr))`}} {...rest}>
        {children}
    </div>
  )
}

export default TableRow