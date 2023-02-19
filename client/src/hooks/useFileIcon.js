import { BsImageFill, BsFileEarmarkFill, BsFileEarmarkPdfFill, BsFillFileEarmarkWordFill, BsFillFileEarmarkMusicFill, BsFileEarmarkPlayFill } from 'react-icons/bs'
import { FaFolder, FaFileCsv } from 'react-icons/fa'
import { GrDocumentPdf } from 'react-icons/gr'


const giveFileType = (fileType, size = 20) => {
    const FileTypes = {
        'jpg': <BsImageFill size={size} color={'#36a1ea'} />,
        'jpeg': <BsImageFill size={size} color={'#36a1ea'} />,
        'png': <BsImageFill size={size} color={'#36a1ea'} />,
        'pdf': <BsFileEarmarkPdfFill size={size} color={'#36a1ea'} />,
        'docx': <BsFillFileEarmarkWordFill size={size} color={'#36a1ea'} />,
        'csv': <FaFileCsv size={size} color={'#36a1ea'} />,
        'mp3': <BsFillFileEarmarkMusicFill size={size} color={'#36a1ea'} />,
        'mp4': <BsFileEarmarkPlayFill size={size} color={'#36a1ea'} />,
    }

    return FileTypes[fileType]
}

export const selectFileIcon = (fileType, size) => {

    if (fileType === 'dir'){
        return <FaFolder size={size ? size : 20} color={'#36a1ea'} />
    } else if (giveFileType(fileType, size)) {
        return giveFileType(fileType, size)
    } else {
        return <BsFileEarmarkFill size={size ? size : 20} color={'#36a1ea'} />
    }
}