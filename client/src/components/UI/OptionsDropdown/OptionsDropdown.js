import React, { useState, useRef } from 'react'
import { BiDotsVerticalRounded } from 'react-icons/bi'
import useOnClickOutside from '../../../utils/use-click-outside'


const OptionsDropdown = ({children}) => {
  const [showDropdown, setShowDropdown] = useState(false)
  const InnerRef = useRef()
  useOnClickOutside(InnerRef, null, () => setShowDropdown(false))

  const handleOptionsDropdownClick = () => {
    setShowDropdown(!showDropdown)
  }
  return (
    <div className='relative' ref={InnerRef}>
        <div onClick={() => setShowDropdown(!showDropdown)}>
            <BiDotsVerticalRounded size={25} color={'#8997a1'} />
        </div>
        {showDropdown &&
            <div className='absolute right-full min-w-[150px] h-auto rounded-lg bg-[#2ba7ff] overflow-hidden py-2'>
                {children}
            </div>
        }
    </div>
  )
}

export default OptionsDropdown