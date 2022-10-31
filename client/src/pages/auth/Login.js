import React, { useState } from 'react'
import Input from '../../components/Input/Input'
import { Link } from 'react-router-dom'
import { useDispatch } from 'react-redux'
import { LoginUser } from '../../store/ducks/users/actions'
import { selectCurrentUser, selectIsAuth } from '../../store/ducks/users/selectors'

const Login = () => {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')

  const dispatch = useDispatch()

  return (
    <div className='w-full h-screen flex items-center justify-center bg-[#f5f6fa]'>
        <div className='w-[70%] h-full flex flex-col'>
            <header className='flex justify-between items-center grow-0 pt-5'>
                <div className='w-[100px] h-[80px] flex items-center justify-center'>
                    <img src="./assets/logo.png" alt="logo" />
                </div>
                <Link to={'/registration'}>
                    <button className='w-[150px] h-[40px] flex items-center justify-center border-[2px] border-[#36a1ea] rounded-md text-[#36a1ea]'>Create Account</button>
                </Link>
            </header>
            <div className='flex items-center justify-center grow'>
                <div className='w-[500px] h-auto p-10 rounded-md border-[2px] border-[#36a1ea]'>
                    <div className='text-[30px] font-bold text-center text-[#273a54] pb-10'>Login</div>
                    <form>
                        <Input placeholder='Email' type='email' value={email} onChange={(e) => setEmail(e.target.value)} />
                        <Input placeholder='Password' type='password' value={password} onChange={(e) => setPassword(e.target.value)} />
                        <div className='flex justify-between items-center pt-5'>
                            <div className='text-base font-semibold text-[#909195]'>Forgot password</div>
                            <button type='button' onClick={() => dispatch(LoginUser(email, password))} className='w-[150px] h-[40px] flex items-center justify-center bg-[#36a1ea] rounded-md text-white font-semibold'>Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
  )
}

export default Login