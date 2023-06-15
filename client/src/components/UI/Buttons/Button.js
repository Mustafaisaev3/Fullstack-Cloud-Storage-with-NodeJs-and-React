import React from "react"

export const Button_Types = {
    primary: 'primary',
    secondary: 'secondary',
    success: 'success',
    info: 'info',
    warning: 'warning',
    danger: 'danger',
    light: 'light',
}


const Button = ({ label, onClick, disabled, outline, light, btn_type = 'primary', small, icon: Icon}) => {

  const btn_types = {
    primary: 'bg-[#36a1ea] border-[#36a1ea] text-white border-[1px]',
    secondary: 'bg-white border-[#36a1ea] text-[#36a1ea] border-[1px]',
    success: 'bg-[#50c793] border-[#50c793] text-white border-[1px]',
    info: 'bg-[#0ce7fa] border-[#0ce7fa] text-white border-[1px]',
    warning: 'bg-[#fa916b] border-[#fa916b] text-white border-[1px]',
    danger: 'bg-[#f1595c] border-[#f1595c] text-white border-[1px]',
    light: 'bg-[#f1f5f9] border-[#f1f5f9] text-white border-[1px]',
  }
  const btn_types_light = {
    primary: 'bg-[#36a1ea] border-[#36a1ea] text-white border-[1px]',
    secondary: 'bg-white border-[#36a1ea] text-[#36a1ea] border-[1px]',
    success: 'bg-[#00ff4454] border-[#0f4] text-white border-[1px]',
    info: 'bg-[#0ce6fa94] border-[#0ce7fa] text-white border-[1px]',
    warning: 'bg-[#fa916b9f] border-[#fa916b] text-white border-[1px]',
    danger: 'bg-[#f1595b94] border-[#f1595c] text-white border-[1px]',
    light: 'bg-[#f1f5f988] border-[#f1f5f9] text-white border-[1px]',
  }

  return (
    <button 
        disabled={disabled}
        onClick={onClick}
        className={`
            flex
            items-center
            justify-center
            gap-2
            relative
            disabled:opacity-70
            disabled:cursor-not-allowed
            rounded-md
            hover:opacity-80
            transition
            w-auto
            min-w-[100px]
            px-4
            py-2
            text-md
            ${light ? btn_types_light[btn_type] : btn_types[btn_type]}
            // ${btn_types_light[btn_type]}
        `}
    >
        {label}
        {Icon && (
            <Icon size={18} />
        )}
    </button>
  )
}

export default Button