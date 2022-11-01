import React from 'react'

const FileInfo = ({icon, title, fileSpace, space, color}) => {
  return (
    <div className='w-full py-4'>
        <div className='flex items-center justify-between pb-2'>
            <div className='grow-0'>{icon}</div>
            <div className='pl-2 grow'>{title}</div>
            <div className='grow-0'>{space} Gb</div>
        </div>
        <div className='w-full h-[7px] border rounded-lg'>
            <div className={`h-[7px] rounded-lg`} style={{width: `${fileSpace/space*100}%`,background: color}}></div>
        </div>
    </div>
  )
}

export default FileInfo