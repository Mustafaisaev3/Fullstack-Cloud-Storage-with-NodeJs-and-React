import { BsImageFill, BsFileEarmarkFill, BsFileEarmarkPdfFill, BsFillFileEarmarkWordFill, BsFillFileEarmarkMusicFill, BsFileEarmarkPlayFill } from 'react-icons/bs'
import { FaFolder, FaFileCsv } from 'react-icons/fa'
import { GrDocumentPdf } from 'react-icons/gr'


export const FileTypes = {
    'jpg': <BsImageFill size={20} color={'#36a1ea'} />,
    'jpeg': <BsImageFill size={20} color={'#36a1ea'} />,
    'png': <BsImageFill size={20} color={'#36a1ea'} />,
    'pdf': <BsFileEarmarkPdfFill size={20} color={'#36a1ea'} />,
    'docx': <BsFillFileEarmarkWordFill size={20} color={'#36a1ea'} />,
    'csv': <FaFileCsv size={20} color={'#36a1ea'} />,
    'mp3': <BsFillFileEarmarkMusicFill size={20} color={'#36a1ea'} />,
    'mp4': <BsFileEarmarkPlayFill size={20} color={'#36a1ea'} />,
}

export const selectFileIcon = (fileType) => {
    if (fileType === 'dir'){
        return <FaFolder size={20} color={'#36a1ea'} />
    } else if (FileTypes[fileType]) {
        return FileTypes[fileType]
    } else {
        return <BsFileEarmarkFill size={20} color={'#36a1ea'} />
    }
}