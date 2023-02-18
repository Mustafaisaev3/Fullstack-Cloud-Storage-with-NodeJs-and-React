import React from 'react'
import Card from '../UI/Card/Card'

// Icons
import { FaFolder } from'react-icons/fa'
import { BiDotsVerticalRounded } from'react-icons/bi'
import { BiImage } from'react-icons/bi'
import { BsFileEarmarkZip } from'react-icons/bs'
import { FiYoutube, FiDownload } from'react-icons/fi'
import { SiApplemusic } from'react-icons/si'
import { HiDocument } from'react-icons/hi'
import OptionsDropdown from '../UI/OptionsDropdown/OptionsDropdown'
import { useUI } from '../../context/ui.context'
import DropdownItem from '../UI/OptionsDropdown/DropdownItem'
import { useSelector } from 'react-redux'
import { selectFiles } from '../../store/ducks/files/selectors'

const FoldersBlock = () => {
  const {openModal} = useUI()

  const files = useSelector(selectFiles)
  console.log(files)

  return (
    <div className='w-full py-10'>
        <div className='flex items-center justify-between pb-5'>
            <div className='text-2xl font-bold text-[#8997a1]'>Folders</div>
            <OptionsDropdown>
                <DropdownItem onClick={openModal}>Add folder</DropdownItem>
                <DropdownItem onClick={openModal}>Add folder</DropdownItem>
                <DropdownItem onClick={openModal}>Add folder</DropdownItem>
                <DropdownItem onClick={openModal}>Add folder</DropdownItem>
            </OptionsDropdown>
        </div> 
        <div className='flex gap-4'>
            <div className='flex gap-4 overflow-x-scroll'>
                {files && files.map((file) => {
                    return  <Card classes='bg-[white] p-2 min-w-[200px]'>
                                <div className='w-full h-full flex flex-col items-center justify-center'>
                                    <FaFolder size={80} color={'#36a1ea'} />
                                    <div>{file.name}</div>
                                </div>
                            </Card>
                    })
                }
                
            </div>
            {/* <div>
                <Card classes='bg-[white]'>
                    <div className='w-full h-full flex items-center justify-center'>
                        <FiYoutube size={30} color={'#f95c5d'} />
                    </div>
                </Card>
            </div>
            <div>
                <Card classes='bg-[white]'>
                    <div className='w-full h-full flex items-center justify-center'>
                        <SiApplemusic size={30} color={'#ffa545'} />
                    </div>
                </Card>
            </div>
            <div>
                <Card classes='bg-[white]'>
                    <div className='w-full h-full flex items-center justify-center'>
                        <HiDocument size={30} color={'#5cadff'} />
                    </div>
                </Card>
            </div>
            <div>
                <Card classes='bg-[white]'>
                    <div className='w-full h-full flex items-center justify-center'>
                        <BsFileEarmarkZip size={30} color={'#8997a1'} />
                    </div>
                </Card>
            </div>
            <div>
                <Card classes='bg-[white]'>
                    <div className='w-full h-full flex items-center justify-center'>
                        <FiDownload size={30} color={'#7ce2aa'} />
                    </div>
                </Card>
            </div> */}
        </div>
    </div>
  )
}

export default FoldersBlock