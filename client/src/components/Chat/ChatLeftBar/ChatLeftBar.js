import React from 'react'
import Input from '../../Input/Input'

const ChatLeftBar = () => {
  return (
    <div className='w-[400px] h-full rounded-md bg-white'>
        <div>
            <div className='flex items-center gap-3 p-5 border-b-[1px]'>
                <div className='w-[50px] h-[50px] rounded-full bg-slate-400'></div>
                <div>
                    <div>Persi Ken</div>
                    <div className='flex gap-1 items-center'> <div className='w-2 h-2 rounded-full bg-[#3cff26]'></div> Availible</div>
                </div>
            </div>

            <div className='w-full h-auto p-5 border-b-[1px]'>
                <Input placeholder={'Serch user'} >
                    <div className='h-full py-2 px-3 text-white bg-[#36a1ea] border-[#36a1ea] cursor-pointer'>Search</div>
                </Input>
                <div>
                    <h2 className='pb-2'>Online Users</h2>
                    <div className='flex gap-2 items-center'>
                    <div className='w-[50px] h-[50px] rounded-lg bg-slate-300 relative'>
                        <div className='absolute right-0 bottom-0 w-3 h-3 border-[3px] border-white rounded-full bg-[#3cff26]'></div>
                    </div>
                    <div className='w-[50px] h-[50px] rounded-lg bg-slate-300 relative'>
                        <div className='absolute right-0 bottom-0 w-3 h-3 border-[3px] border-white rounded-full bg-[#3cff26]'></div>
                    </div>
                    <div className='w-[50px] h-[50px] rounded-lg bg-slate-300 relative'>
                        <div className='absolute right-0 bottom-0 w-3 h-3 border-[3px] border-white rounded-full bg-[#3cff26]'></div>
                    </div>
                    <div className='w-[50px] h-[50px] rounded-lg bg-slate-300 relative'>
                        <div className='absolute right-0 bottom-0 w-3 h-3 border-[3px] border-white rounded-full bg-[#3cff26]'></div>
                    </div>
                    <div className='w-[50px] h-[50px] rounded-lg bg-slate-300'></div>
                    </div>
                </div>
            </div>

            <div className='w-full h-auto'>
                <div className='w-full h-auto'>
                <div className='flex items-center gap-2 px-5 py-4 hover:bg-slate-200'>
                    <div className='w-[40px] h-[40px] rounded-full bg-slate-400'></div>
                    <div className='grow'>
                        <div>Persi Ken</div>
                        <div className='flex gap-1 items-center text-sm'>Some optional text Availible</div>
                    </div>
                    <div className='text-sm h-full'>
                    <div>10 min</div>
                    </div>
                </div>
                </div>
                <div className='w-full h-auto'>
                <div className='flex items-center gap-2 px-5 py-4 hover:bg-slate-200'>
                    <div className='w-[40px] h-[40px] rounded-full bg-slate-400'></div>
                    <div className='grow'>
                        <div>Persi Ken</div>
                        <div className='flex gap-1 items-center text-sm'>Some optional text Availible</div>
                    </div>
                    <div className='text-sm h-full'>
                    <div>10 min</div>
                    </div>
                </div>
                </div>
                <div className='w-full h-auto'>
                <div className='flex items-center gap-2 px-5 py-4 hover:bg-slate-200'>
                    <div className='w-[40px] h-[40px] rounded-full bg-slate-400'></div>
                    <div className='grow'>
                        <div>Persi Ken</div>
                        <div className='flex gap-1 items-center text-sm'>Some optional text Availible</div>
                    </div>
                    <div className='text-sm h-full'>
                    <div>10 min</div>
                    </div>
                </div>
                </div>
                <div className='w-full h-auto'>
                <div className='flex items-center gap-2 px-5 py-4 hover:bg-slate-200'>
                    <div className='w-[40px] h-[40px] rounded-full bg-slate-400'></div>
                    <div className='grow'>
                        <div>Persi Ken</div>
                        <div className='flex gap-1 items-center text-sm'>Some optional text Availible</div>
                    </div>
                    <div className='text-sm h-full'>
                    <div>10 min</div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
  )
}

export default ChatLeftBar