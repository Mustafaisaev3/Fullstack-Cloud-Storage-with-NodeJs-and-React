import React from 'react'
import { useUI } from '../../../../context/ui.context'


const MainView = () => {
  // const {confirmationModalData: {data}, closeConfirmationModal} = useUI()
  const {confirmationModalData: {data}, closeConfirmationModal } = useUI()

  const handleConfirmBtn = (e) => {
    e.stopPropagation()
    data.perfomedFunction()
    closeConfirmationModal()
  }

  const handleCancelBtn = (e) => {
    e.stopPropagation()
    closeConfirmationModal()
  }
  return (
        <div className='w-[400px] h-auto p-[40px] rounded-md bg-[#ffffff] flex flex-col justify-center items-center '>
            <div className='font-bold text-2xl text-[#252836] text-center'>{data.questionText}</div>
            <div className='flex gap-4 pt-8'>
                <div className='px-4 py-2 bg-green-500 text-[#252836] font-bold rounded-sm cursor-pointer' onClick={(e) => handleConfirmBtn(e)}>Confirm</div>
                <div className='px-4 py-2 bg-red-500 text-[#252836] font-bold rounded-sm cursor-pointer'onClick={(e) => handleCancelBtn(e)}>Сancel</div>
            </div>
        </div>
  )
}

export default MainView