import React, { useEffect, useState} from 'react'
import { useUI } from '../context/ui.context'

import { useStorageComponent } from '../hooks/useStorages'
import { uploadFile } from '../store/ducks/files/actions'


import { IoMdAddCircleOutline } from 'react-icons/io'
import { MdDownloading } from 'react-icons/md'
// import { GiHamburgerMenu } from 'react-icons/gi'
import { ImMenu } from 'react-icons/im'
import { BsFolder2Open, BsFillGridFill } from 'react-icons/bs'
import { useDispatch, useSelector } from 'react-redux'
import { selectCurrentDir, selectFiles, selectAllFiles } from '../store/ducks/files/selectors'
// import FolderStructure from '../components/File/FolderTree/FolderStructure'
import FolderStructure from '../components/File/FolderTree/FolderStructure'
import { setFiles, setAllFiles } from '../store/ducks/files/actions'
import FilesGrid from '../components/File/FilesGrid/FilesGrid'
import FilesRow from'../components/File/FilesRow'

const FilesViewTypes = {
  GRID_VIEW: 'GRID_VIEW',
  ROW_VIEW: 'ROW_VIEW'
}

const Files = () => {
  const {openModal, setModalView, showModal, modalView, openUploader} = useUI()
  const [filesView, setFilesView] = useState(FilesViewTypes.ROW_VIEW)
 
  const addFolderBtnClick = () => {
      setModalView('ADD_FOLDER_VIEW')
      console.log(showModal, modalView)
      openModal()
  }
  const currentDir = useSelector(selectCurrentDir)
  const filesTree = useSelector(selectAllFiles)
  const files = useSelector(selectFiles)
  const dispatch = useDispatch()

  useEffect(() => {
    dispatch(setAllFiles())
  }, [files])

  useEffect(() => {
    dispatch(setFiles(currentDir))
  }, [currentDir])

  const handleUploadFile = (e) => {
    const files = [...e.target.files]
    dispatch(uploadFile(files[0], currentDir))
  }

  return (
    <div className='flex w-full h-full font-bold py-5 overflow-hidden'>
      <div className='w-full'>
        {/* <div className='text-2xl text-[#8997a1]'>Files</div> */}
        <div className='w-full h-auto flex justify-between py-5 border-b-[1px] border-[#c0c0c0]'>
          <div>Облачный диск</div>
          <div className='flex gap-4'>
            <div className='flex items-center gap-2'>

              <div 
                className={`p-1 rounded-md hover:bg-slate-300 cursor-pointer text-[${filesView === FilesViewTypes.GRID_VIEW ? '#36a1ea' : '#ffffff'}]`} 
                onClick={() => setFilesView(FilesViewTypes.GRID_VIEW)}
              >
                <BsFillGridFill size={20} />
              </div>

              <div 
                className={`p-1 rounded-md hover:bg-slate-300 cursor-pointer text-[${filesView === FilesViewTypes.ROW_VIEW ? '#36a1ea' : '#ffffff'}]`} 
                onClick={() => setFilesView(FilesViewTypes.ROW_VIEW)}
              >
                <ImMenu size={20} />
              </div>
              
            </div>
            <div className='flex items-center gap-1 cursor-pointer' onClick={addFolderBtnClick}>
              <IoMdAddCircleOutline size={30} color={'#5cca72'} />
              <span className='text-sm'>Создать папку</span>
            </div>
            <div className='cursor-pointer'>
              <label className='text-sm flex items-center gap-1 cursor-pointer' for="upload_file">
                <MdDownloading size={30} color={'#36a1ea'} />
                Загрузить...
                <input type="file" className='hidden' id='upload_file' onChange={(e) => handleUploadFile(e)}/>
              </label>
            </div>
          </div>
        </div>  

        <div className='w-full h-full flex pt-5'>

          <div className='w-[400px] h-full'>
            <div>MY FOLDERS</div>
            <div className='h-full overflow-y-scroll pb-3'>
              {filesTree && filesTree.map(node => {
                return <FolderStructure _id={node._id} {...node} />
              })}
            </div>
          </div>


          <div className='pl-[30px] pb-[50px] grow'>
            <div>DOCUMENTS</div>
              {files && files.length 
                ?
                <>
                  {filesView === FilesViewTypes.GRID_VIEW ? (
                    <FilesGrid files={files} />
                  ) : (
                    <FilesRow files={files} />
                  )}
                </>
                :
                <div className='w-full h-full flex flex-col items-center justify-center'>
                  <BsFolder2Open size={300} color={'#696969b5'} />
                  <div className='text-[50px] text-[#696969b5] font-semibold pt-8'>This folder is empty</div>
                </div>
              }
                
          </div>
        </div>
      </div>
    </div>
  )
}

export default Files