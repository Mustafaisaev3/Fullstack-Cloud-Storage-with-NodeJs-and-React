import React from 'react'
import Card from './UI/Card/Card'
import { useStorageComponent } from '../hooks/useStorages'
import CircularProgressBar from './CircularProgressBar'

const StorageCard = ({storageName}) => {
  const {storages} = useStorageComponent() 
  return (
    <Card classes={'bg-[#36a1ea]'}>
        <div className='w-[250px] h-auto'>
            <div className='w-auto '>
                <div className='w-[50px] p-3 bg-white rounded-xl'>
                    {storages[storageName]}
                </div>
            </div>
            <div className='flex items-center justify-between pt-2'>
                <div>
                    <h2 className='text-white text-lg font-bold'>{storageName}</h2>
                    <div className='text-white text-sm'>62 Gb / 127 Gb</div>
                </div>
                {/* <div className='w-[50px] h-[50px] flex items-center justify-center rounded-full bg-[#64bbf566]'></div> */}
                <CircularProgressBar textLength={25} />
            </div>
        </div>
    </Card>
  )
}

export default StorageCard