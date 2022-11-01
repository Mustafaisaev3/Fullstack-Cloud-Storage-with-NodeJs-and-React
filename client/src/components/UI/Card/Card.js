import React from 'react'

const Card = ({children, classes, ...props}) => {
  return (
    <div className={`rounded-2xl p-4 ${classes}`} {...props}>
        {children}
    </div>
  )
}

export default Card