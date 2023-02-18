import React from 'react'
import FolderParent from './FolderParent'

const FolderStructure = ({childFiles, name, _id, type}) => {
  return (
    <FolderParent folderName={name} _id={_id} type={type} >
        {(childFiles ?? []).map((node) => {
          return <FolderStructure {...node}/>
        })}
    </FolderParent>
  )
}

export default FolderStructure

