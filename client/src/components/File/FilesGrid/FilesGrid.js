import React from 'react' 
import { setCurrentDir } from '../../../store/ducks/files/actions';
import {FaFolder} from 'react-icons/fa'
import { useDispatch } from 'react-redux';
import FilesGridItem from './FilesGridItem';

const FilesGrid = ({files}) => {

  return (
    <div className='w-full h-full overflow-y-auto'>
        <div className='grid grid-cols-5 gap-6'>
            {files ? files.map((file) => {
                return (
                    // <div className='w-full h-[200px] rounded-md flex flex-col items-center justify-center bg-white overflow-hidden p-5 border-[5px] border-transparent hover:border-[#36a1ea] transition-all duration-400'>
                    <FilesGridItem file={file} />
                )
            }) 
            : null}
        </div>
    </div>
  )
}

export default FilesGrid