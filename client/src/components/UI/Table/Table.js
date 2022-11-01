import React from 'react'

const Table = ({children}) => {
  return (
    <div className='w-full h-full overflow-hidden'>
        {children}
    </div>
  )
}

export default Table