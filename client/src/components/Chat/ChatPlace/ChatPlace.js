import React from 'react'
import Input from '../../Input/Input'
import { FaTelegramPlane } from 'react-icons/fa'
import { AiOutlinePaperClip } from 'react-icons/ai'
import LeftMessage from '../Message/LeftMessage'
import RightMessage from '../Message/RightMessage'
import MessageBlock from '../Message/MessageBlock'
import { useSelector } from 'react-redux'
import { selectActiveConversationMessages, selectActiveCompanion, selectActiveConversation } from '../../../store/ducks/chat/selectors'
import { useState } from 'react'
import axios from 'axios'

const ChatPlace = ({currentUser}) => {
  const [inputMessage, setInputMessage] = useState('')
  const [uploadFiles, setUploadFiles] = useState([])
  
  const activeСompanion = useSelector(selectActiveCompanion)
  const activeConversationMessages = useSelector(selectActiveConversationMessages)
  const activeConversation = useSelector(selectActiveConversation)

  const setMessage = async () => {
    const formData = new FormData()
    uploadFiles.forEach(file => {
        formData.append('files', file.file)
    })
    formData.append('message', inputMessage)
    formData.append('from', currentUser.id)
    formData.append('to', activeСompanion._id)
    formData.append('conversationId', activeConversation._id ? activeConversation._id : null)

    console.log(formData, 'formDataFiles')

    const response = await axios.post(`http://localhost:5000/api/chat/setMessage`, 
        formData, 
        {
            headers: {
                Authorization: `Bearer ${localStorage.getItem('token')}`,
            }
        })

    console.log(response.data)

  }

  const handleFildeDeleteBtn = (fileUrl) => {
    const filteredFiles = uploadFiles.filter(item => {
        return item.fileUrl != fileUrl
    })

    setUploadFiles(filteredFiles)
  }

  const handleUploadFileBtn = (e) => {
    console.log(e.target.files[0])
    const file = e.target.files[0]

    console.log(file)
    const fileObj = new Blob([file])
    const fileUrl = URL.createObjectURL(fileObj)
    setUploadFiles(prev => [...prev, {
        fileUrl,
        file
    }])
  }

  return (
    <div className='h-full flex flex-col grow rounded-md bg-white'>

        <div className='flex items-center gap-3 p-5  border-b-[1px]'>
            <div className='w-[50px] h-[50px] rounded-full bg-slate-400'></div>
            <div>
                <div>Sam Samual</div>
                <div className='flex gap-1 items-center'> <div className='w-2 h-2 rounded-full bg-[#3cff26]'></div> online</div>
            </div>
        </div>

        <div className='w-full gap-3 grow p-5 flex flex-col overflow-y-scroll'>
            {activeConversationMessages && activeConversationMessages.map((message) => {
                console.log(message.files)
                if(message.from !== currentUser.id){
                    return  <MessageBlock>
                              <LeftMessage message={message.message}/>
                            </MessageBlock>
                } else {
                    return  <MessageBlock>
                              <RightMessage message={message.message}/>
                            </MessageBlock>
                }
            })}

            

            {/* <MessageBlock>
                <RightMessage />
                <RightMessage />
            </MessageBlock>
            <MessageBlock>
                <LeftMessage />
            </MessageBlock>
            <MessageBlock>
                <RightMessage />
                <RightMessage />
            </MessageBlock>
            <MessageBlock>
                <LeftMessage />
            </MessageBlock>
            <MessageBlock>
                <RightMessage />
                <RightMessage />
            </MessageBlock> */}
        </div>

        <div className='w-full p-5 border-t-[1px] '>
            <div className='h-[80px] gap-3 flex items-center'>
                <Input placeholder={'Search word'} value={inputMessage} onChange={(e) => setInputMessage(e.target.value)} />
                <div className='rounded-full p-2' >
                    <input type="file" className='hidden' id='uploadFile' onChange={(e) => handleUploadFileBtn(e)} />
                    <label htmlFor="uploadFile" className='cursor-pointer' >
                        <AiOutlinePaperClip size={20} className={''} />
                    </label>
                </div>
                <div className='rounded-full p-2 bg-[#36a1ea] cursor-pointer' onClick={setMessage}>
                    <FaTelegramPlane size={20} color={'white'} className={''} />
                </div>
            </div>
            <div className='flex gap-2'>
                {uploadFiles && uploadFiles.map(file => {
                    console.log(file)
                    
                    if(file.file.type.includes('image')){
                        return <div className='w-[60px] h-[60px] rounded-md border-[1px] overflow-hidden' onClick={() => handleFildeDeleteBtn(file.fileUrl)}><img src={file.fileUrl} /></div>
                    } else {
                        return <div className='w-[60px] h-[60px] rounded-md border-[1px] overflow-hidden' onClick={() => handleFildeDeleteBtn(file.fileUrl)}>File</div>
                    }
                })}
            </div>
        </div>
    </div>
  )
}

export default ChatPlace