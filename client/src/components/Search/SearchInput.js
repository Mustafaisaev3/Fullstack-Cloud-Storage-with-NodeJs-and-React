import React, {useState} from 'react'
import { BsSearch } from 'react-icons/bs'
import { useHistory } from 'react-router-dom'

const SearchInput = (props) => {
  const [searchValue, setSerachValue] = useState('') 
  const history = useHistory()

  const searchInputHandler = (e) => {
    setSerachValue(e.target.value)
  }

  const handleSeacrh = () => {
    if (!searchValue.length) {
      return
    }

    history.push(`/search?search=${searchValue}`)

  }

  return (
    <div className='w-[500px] h-[50px] px-3 bg-white rounded-2xl flex items-center overflow-hidden'>
        <input type="text" value={searchValue} onChange={searchInputHandler} className='h-full w-full pl-3 outline-none' {...props}/>        
        <div className={`p-2 rounded-md ${searchValue.length ? 'text-white bg-[#36a1ea]' : 'text-[#8997a1]'}`} onClick={handleSeacrh}>
            <BsSearch size={20} />
        </div>
    </div>
  )
}

export default SearchInput