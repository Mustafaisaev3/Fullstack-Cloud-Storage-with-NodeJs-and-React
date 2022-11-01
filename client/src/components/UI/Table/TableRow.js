import React from 'react'

const TableRow = ({children, columnNumber}) => {
    console.log(children.length)
  return (
    <div className={`w-full h-[40px] items-center grid grid-cols-${children.length} border-b-[1px] cursor-pointer hover:shadow-xl`} style={{'grid-template-columns': `repeat(${columnNumber ? columnNumber : children.length}, minmax(0, 1fr))`}}>
        {children}
    </div>
  )
}

export default TableRow