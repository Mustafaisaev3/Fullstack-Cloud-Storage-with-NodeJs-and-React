import React from 'react'
import { IoIosArrowBack, IoIosArrowForward } from 'react-icons/io'

const Pagination = ({ pagination }) => {
  const { prev, next, jump, currentPage, maxPage } = pagination
  let pages = []
  for(let i = 1; i <= maxPage; i++){
    pages.push(i)
  }

  return (
    <ul className='flex gap-4'>
        <div onClick={() => prev()}>
            <li className='w-[30px] h-[30px] bg-[#ffffff] text-[#2ba7ff] border-[1px] border-[#2ba7ff] rounded-md flex items-center justify-center '>
                <IoIosArrowBack size={20} color={'#2ba7ff'} />
            </li>
        </div>

        {pages.map(page => {
            return (
                <li onClick={() => jump(page)} className={`w-[30px] h-[30px] ${currentPage === page ? 'bg-[#2ba7ff] text-[#ffffff]' : 'bg-[#ffffff] text-[#2ba7ff]'}  border-[1px] border-[#2ba7ff] rounded-md flex items-center justify-center `}>
                    {page}
                </li>
            )
        })}

        <div onClick={() => next()}>
            <li className='w-[30px] h-[30px] bg-[#ffffff] text-[#2ba7ff] border-[1px] border-[#2ba7ff] rounded-md flex items-center justify-center '>
                <IoIosArrowForward size={20} color={'#2ba7ff'} />
            </li>
        </div>
    </ul>
  )
}

export default Pagination