import React, { useState } from 'react'
import {IoMdEye, IoMdEyeOff} from 'react-icons/io'

const Input = ({label, ...props}) => {
  const [showPassword, setShowPassword] = useState(false)

  return (
    <div className='w-full h-auto border rounded-md my-4 overflow-hidden'>
        <label htmlFor={props.name}>{label}</label>
        <div>
            {props.type === 'password'
                ?
                <div className='flex items-center justify-between  bg-white'>
                    <input {...props} type={showPassword ? 'text' : 'password'} className={'w-full outline-none p-2'} />
                    <div onClick={() => setShowPassword(!showPassword)} className='h-full cursor-pointer'>
                        {!showPassword 
                            ?
                            <IoMdEye size={25} color={'#273a54'} className="mx-2" />
                            :
                            <IoMdEyeOff size={25} color={'#273a54'} className="mx-2" />
                        }
                    </div> 
                </div>
                :
                <input {...props} className={'w-full outline-none p-2'} />

            }
        </div>
    </div>
  )
}

export default Input