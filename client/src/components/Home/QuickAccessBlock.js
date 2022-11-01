import React from 'react'
import Card from '../UI/Card/Card'

// Icons
import { BiImage } from'react-icons/bi'
import { BsFileEarmarkZip } from'react-icons/bs'
import { FiYoutube, FiDownload } from'react-icons/fi'
import { SiApplemusic } from'react-icons/si'
import { HiDocument } from'react-icons/hi'

const QuickAccessBlock = () => {
  return (
    <div className='w-full py-10'>
        <div className='pb-5 text-2xl text-[#8997a1]'>Quick Access</div>
        <div className='flex gap-4'>
            <div>
                <Card classes='bg-[white] p-2'>
                    <div className='w-full h-full flex items-center justify-center'>
                        <BiImage size={30} color={'#36a1ea'} />
                    </div>
                </Card>
            </div>
            <div>
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
            </div>
        </div>
    </div>
  )
}

export default QuickAccessBlock