// Icons
import { BiImage } from'react-icons/bi'
import { BsFileEarmarkZip } from'react-icons/bs'
import { FiYoutube, FiDownload } from'react-icons/fi'
import { SiApplemusic } from'react-icons/si'
import { HiDocument } from'react-icons/hi'

export const quickAccessItems = [
    {
        type: 'music',
        iconData: <SiApplemusic size={30} color={'#ffa545'} />,
        fileTypes: ['mp3']
    },
    {
        type: 'image',
        iconData: <BiImage size={30} color={'#36a1ea'} />,
        fileTypes: ['jpg', 'jpeg', 'png']
    },
    {
        type: 'video',
        iconData: <FiYoutube size={30} color={'#f95c5d'} />,
        fileTypes: ['mp4']
    },
    {
        type: 'doc',
        iconData: <HiDocument size={30} color={'#5cadff'} />,
        fileTypes: ['docx']
    },

]

