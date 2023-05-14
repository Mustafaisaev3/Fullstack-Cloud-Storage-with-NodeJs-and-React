import React, {useState} from 'react'
import { Link } from 'react-router-dom'
import { TiArrowSortedDown } from 'react-icons/ti'
import { FaFolder, FaFolderOpen } from 'react-icons/fa'
import { setCurrentDir } from '../../../store/ducks/files/actions'
import { useDispatch } from 'react-redux'

const FolderParent = ({children, folderName, _id, type, hasChildFiles}) => {
  const [activeChildren, setActiveChildren] = useState()
  const dispatch = useDispatch()

  return (
    <ul className='w-full h-auto' id={_id}>
        {type === 'dir' 
            ?
            <li className='py-2'>
                <div className='flex items-center pb-2'>
                    <div className='w-[20px]' >
                        {children ? <TiArrowSortedDown size={20} color={'#000'} className={`${activeChildren ? '-rotate-45' : '-rotate-90'} cursor-pointer`} onClick={() => setActiveChildren(!activeChildren)} /> : null}
                    </div>
                    <div className='flex items-center pl-3 cursor-pointer' onClick={() => dispatch(setCurrentDir(_id))}>
                        {activeChildren
                            ?
                            <FaFolderOpen size={25} color={'#36a1ea'} />
                            :
                            <FaFolder size={25} color={'#36a1ea'} />
                        }
                        <Link to={`/files/${_id}`}>
                            <div className='pl-2'>{folderName}</div>
                        </Link>
                    </div>
                </div>

                {activeChildren && 
                    <div className='pl-5'>
                        <ul className='w-full h-auto'>
                            {children}
                        </ul>
                    </div>
                }
            </li>
            : null
        }
    </ul>
  )
}

export default FolderParent