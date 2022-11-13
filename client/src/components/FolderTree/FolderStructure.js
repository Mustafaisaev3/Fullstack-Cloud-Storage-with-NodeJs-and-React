import React from 'react'
import FolderParent from './FolderParent'

const FolderStructure = ({childFiles, name, _id}) => {
  return (
    <FolderParent folderName={name} _id={_id} >
        {(childFiles ?? []).map((node) => {
            return <FolderStructure {...node}/>
        })}
    </FolderParent>
  )
}

export default FolderStructure

