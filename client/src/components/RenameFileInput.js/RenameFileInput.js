import React, { useState } from 'react'
import { useUI } from '../../context/ui.context'
import TableCell from '../UI/Table/TableCell'

const RenameFileInput = ({className, colSpan, file}) => {
    const {openConfirmationModal, setConfirmationModalData} = useUI()
    const [showChangeNameInput, setShowChangeNameInput] = useState(false)
    const [changeFileName, setChangeFileName] = useState(file.name)

    const handleChangeFileName = (e) => {
        if (e.detail === 2) {
            setShowChangeNameInput(true)
        }
    }

    const handleFocusOnInput = (e) => {
        setChangeFileName(e.target.value)
    }

    const handleFocusOutOnInput = (e) => {
        openConfirmationModal()
        setConfirmationModalData({ data: {questionText: `Change file name?`, perfomedFunction: () => {
            console.log('confirm')
        }} });
        setShowChangeNameInput(false)
    }

  return (
    <>
    {!showChangeNameInput
        ?
        <TableCell title={file.name} colSpan={colSpan} onClick={(e) => handleChangeFileName(e)}  />
        :
        <div className={`w-full h-full flex items-center text-clipellipsis whitespace-nowrap overflow-hidden ${className}`} style={{'grid-column': `span ${colSpan}`}}>
            <input value={changeFileName} onChange={(e) => handleFocusOnInput(e)} onBlur={(e) => handleFocusOutOnInput(e)} className={'w-full h-full px-3 outline-1 outline-[#2ba7ff8d]'} autoFocus />
        </div>
    }
    </>

  )
}

export default RenameFileInput