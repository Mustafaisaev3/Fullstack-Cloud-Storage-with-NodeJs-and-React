import React from 'react'

const CircularProgressBar = ({progress, radius, text_size = 15}) => {
    let circleData = {
        radius,
        getperimetr () {
            return 2 * Math.PI * this.radius
        },
        getStrokeLength(){
          return  this.getperimetr() / 100 * progress
        }
    }
  return (
    <div className='relative'>
        <svg className='rotate-[-90deg] border-none' width={80} height={80}>
            <circle r={circleData.radius} fill='none' cx={'50%'} cy={'50%'} stroke={progress >= 100 ? 'red' : 'white '} strokeWidth={2}  stroke-dasharray={circleData.getperimetr()}/>
            <circle r={circleData.radius} fill='none' cx={'50%'} cy={'50%'} stroke={'#2b8fd3'} strokeWidth={2}  stroke-dasharray={circleData.getperimetr()}  strokeDashoffset={-circleData.getStrokeLength()}/>
        </svg>
        <div className={`absolute top-1/2 left-1/2 translate-x-[-50%] translate-y-[-50%] text-[${text_size}px] text-white`} style={{'fontSize': `${text_size}px`}}>
            {progress}%
        </div>
    </div>
  )
}

export default CircularProgressBar