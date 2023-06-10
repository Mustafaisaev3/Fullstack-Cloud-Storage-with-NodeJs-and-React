import React, { useLayoutEffect, useState } from 'react'
import { useHistory, useLocation } from 'react-router-dom'
import { FiSearch } from 'react-icons/fi'
import { BsFillGridFill, BsSearch } from 'react-icons/bs'
import { ImMenu } from 'react-icons/im'
import FilesRow from '../components/File/FilesRow'
import FilesGrid from '../components/File/FilesGrid/FilesGrid'
import usePagination from '../hooks/usePagination'
import { searchFile } from '../services/SearchService'
import PuffLoader from "react-spinners/PuffLoader";

const FilesViewTypes = {
    GRID_VIEW: 'GRID_VIEW',
    ROW_VIEW: 'ROW_VIEW'
}

function useQuery () {
    return new URLSearchParams(useLocation().search)
}

const Seacrh = () => {
  const [files, setFiles] = useState()
  const [loading, setLoading] = useState(false)
  const [searchValue, setSearchValue] = useState('')
  const [filesView, setFilesView] = useState(FilesViewTypes.ROW_VIEW)

  const history = useHistory()
  
  const query = useQuery().get('search')?.replace(/"/g, '')
  console.log(query)

  useLayoutEffect(() => {
    setLoading(true)
    const search = async () => {
        const { data } = await searchFile({'search' : query})
        setFiles(data)
        setLoading(false)
    }

    search()
  }, [query])

  const pagination = usePagination(files, 10)

  const handleSeacrh = () => {
    if (!searchValue.length) {
      return
    }

    history.push(`/search?search=${searchValue}`)
  }

  if (!query) {
    return (
        <div className='w-full h-full flex flex-col items-center justify-center gap-4'>
            <div className='text-[50px] font-medium'>Search File!</div>
            <div className='w-[500px] h-[50px] px-3 bg-white rounded-2xl flex items-center overflow-hidden'>
                <input type="text" value={searchValue} onChange={(e) => setSearchValue(e.target.value)} className='h-full w-full pl-3 outline-none'/>        
                <div className={`p-2 rounded-md ${searchValue.length ? 'text-white bg-[#36a1ea]' : 'text-[#8997a1]'}`} onClick={handleSeacrh}>
                    <BsSearch size={20} />
                </div>
            </div>
        </div>
    )
  }

  if (loading) {
    return (
        <div className='w-full h-full flex items-center justify-center text-[100px]'>
            <PuffLoader color='#36a1ea' size={200} />
        </div>
    )
  }

  return (
    <div className='flex flex-col w-full h-full font-bold py-5 overflow-hidden'>
        <div className='w-full h-auto flex justify-between py-5 border-b-[1px] border-[#c0c0c0]'>
          <div className='flex items-center gap-8'>
            <div className='text-2xl text-[#8997a1]'>Search</div>
          </div>
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
          </div>
        </div>
        {files && files.length ? (
            <div className='flex-1 w-full h-full overflow-hidden pt-5'>
                {filesView === FilesViewTypes.GRID_VIEW ? (
                    <FilesGrid files={files} />
                ) : (
                    <FilesRow files={files} pagination={pagination}/>
                )}
            </div>
        ) : (
            <div className='w-full h-full flex flex-col items-center justify-center gap-4'>
                <FiSearch size={200} />
                <div className='text-[50px] font-medium'>File not found</div>
            </div>
        )
        }
    </div>
  )
}

export default Seacrh