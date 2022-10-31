import React from 'react'
import { useDispatch } from 'react-redux'
import { LogoutUser } from '../store/ducks/users/actions'

const Home = () => {
  const dispatch = useDispatch()
  
  return (
    <div className='flex items-center justify-center'>
        <div className='border p-3 rounder-md cursor-pointer' onClick={() => dispatch(LogoutUser())}>Logout</div>
    </div>
  )
}

export default Home