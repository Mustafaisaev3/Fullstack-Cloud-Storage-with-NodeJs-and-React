import React, {useRef} from 'react'
import { useUI } from '../../../context/ui.context'
import useOnClickOutside from '../../../utils/use-click-outside';
import { Portal } from 'react-portal';




const Modal = ({open, onClose, children}) => {
  const {closeModal} = useUI()
  const modalRootRef = useRef()
  const modalInnerRef = useRef()
  console.log(open)
  
  useOnClickOutside(modalInnerRef, modalRootRef, () => closeModal())
  return (
        <Portal>
            {open && <div className='flex items-center justify-center absolute left-0 top-0 w-full h-full z-[1000] bg-[#0000005c]' ref={modalRootRef}>
                <div className='w-auto h-auto rounded-md overflow-hidden ' ref={modalInnerRef}>
                    {children}
                </div>
            </div>}
        </Portal>
  )
}

export default Modal