import React from 'react'
import { useUI } from '../../context/ui.context'
import Uploader from './Uploader'

const ManagedUploader = () => {
  const {showUploader, closeUploader} = useUI()
  return (
    <Uploader open={showUploader} closeUploader={closeUploader} />
  )
}

export default ManagedUploader