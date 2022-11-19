import React, {useState} from 'react'
import { BsSearch } from 'react-icons/bs'
import { useDispatch } from 'react-redux'
import { searchFile } from '../../store/ducks/files/actions'

const SearchInput = (props) => {
  const [searchName, setSerachName] = useState('') 
  const dispatch = useDispatch()
  const searchInputHandler = (e) => {
    setSerachName(e.target.value)
    
  }
  return (
    <div className='w-[500px] h-[50px] px-3 bg-white rounded-2xl flex items-center overflow-hidden'>
        <div onClick={() => {dispatch(searchFile(searchName))}}>
            <BsSearch size={20} color={'#8997a1'} />
        </div>
        <input type="text" value={searchName} onChange={searchInputHandler} className='h-full w-full pl-3 outline-none' {...props}/>        
    </div>
  )
}

export default SearchInput