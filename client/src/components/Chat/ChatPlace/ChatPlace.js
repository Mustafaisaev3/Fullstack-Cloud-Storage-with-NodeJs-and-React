import React, { useEffect, useState, useRef } from 'react'
import Input from '../../Input/Input'
import { FaTelegramPlane } from 'react-icons/fa'
import { AiOutlinePaperClip } from 'react-icons/ai'
import { BsChatSquareTextFill } from 'react-icons/bs'
import LeftMessage from '../Message/LeftMessage'
import RightMessage from '../Message/RightMessage'
import MessageBlock from '../Message/MessageBlock'
import { useSelector, useDispatch } from 'react-redux'
import { selectCurrentUser } from '../../../store/ducks/users/selectors'
import { selectMessages } from '../../../store/ducks/chat/selectors'
import { sendMessage, getMessages } from '../../../store/ducks/chat/actions'

const ChatPlace = ({ activeConversation, socket }) => {
  const dispatch = useDispatch()
  const messagesBlockRef = useRef(null)
  console.log(messagesBlockRef)

  const [inputMessage, setInputMessage] = useState('')
  const [uploadFiles, setUploadFiles] = useState([])
  
  const currentUser = useSelector(selectCurrentUser)
  const messages = useSelector(selectMessages)

//   const sendMessage = async () => {
//     const formData = new FormData()
//     uploadFiles.forEach(file => {
//         formData.append('files', file.file)
//     })
//     formData.append('message', inputMessage)
//     formData.append('from', currentUser.id)
//     formData.append('to', activeСompanion._id)
//     formData.append('conversationId', activeConversation._id ? activeConversation._id : null)

//     console.log(formData, 'formDataFiles')

//     const response = await axios.post(`http://localhost:5000/api/chat/setMessage`, 
//         formData, 
//         {
//             headers: {
//                 Authorization: `Bearer ${localStorage.getItem('token')}`,
//             }
//         })

//     console.log(inputMessage)

//   }

//   const handleFildeDeleteBtn = (fileUrl) => {
//     const filteredFiles = uploadFiles.filter(item => {
//         return item.fileUrl != fileUrl
//     })

//     setUploadFiles(filteredFiles)
//   }

//   const handleUploadFileBtn = (e) => {
//     console.log(e.target.files[0])
//     const file = e.target.files[0]

//     console.log(file)
//     const fileObj = new Blob([file])
//     const fileUrl = URL.createObjectURL(fileObj)
//     setUploadFiles(prev => [...prev, {
//         fileUrl,
//         file
//     }])
//   }
  const receiver = activeConversation && activeConversation.members.find(user => user._id !== currentUser.id)

  useEffect(() => {
    if(activeConversation) {
        dispatch(getMessages(activeConversation._id))
    }
  }, [activeConversation])

  useEffect(() => {
    socket && socket.on("getMessage", (data) => {
        const msg = {
          sender: data.sender,
          text: data.text,
          conversationId: data.conversationId,
          createdAt: Date.now(),
        }

        dispatch(getMessages(activeConversation._id))
      });
  }, [socket])

  setTimeout(() => {
    messagesBlockRef.current.scrollTop = messagesBlockRef.current.scrollHeight
  }, 0)



  const handleSendMessage = () => {
    const msgObj = {
        conversationId: activeConversation._id,
        sender: currentUser.id,
        receiver:  receiver._id, 
        text: inputMessage
    }

    dispatch(sendMessage(msgObj))
    socket.emit('sendMessage', msgObj)
    console.log(msgObj)
  }

  return (
    <div className='h-full flex flex-col grow rounded-md bg-white'>
        {activeConversation ? (
        <div className='w-full h-full flex flex-col'>
            <div className='header border-b-[1px] h-[80px]'>
                    <div className='flex items-center gap-3 p-5'>
                        <div className='w-[50px] h-[50px] rounded-full bg-slate-400'></div>
                        <div>
                            <div>{receiver.email}</div>
                            <div className='flex gap-1 items-center'> <div className='w-2 h-2 rounded-full bg-[#3cff26]'></div> online</div>
                        </div>
                    </div>
                
            </div>

            <div ref={messagesBlockRef} className='w-full gap-3 grow p-5 flex flex-col overflow-y-scroll'>
                {messages && messages.map((message) => {
                    if(message.sender === currentUser.id){
                        return (
                            <MessageBlock>
                                <RightMessage message={message.text}/>
                            </MessageBlock>
                        )
                    } else if (message.sender !== currentUser.id) {
                        return(
                            <MessageBlock>
                                <LeftMessage message={message.text}/>
                            </MessageBlock> 
                        )  
                    }
                })}

            </div>

            <div className='w-full p-5 border-t-[1px] '>
                <div className='h-[80px] gap-3 flex items-center'>
                    <Input placeholder={'Search word'} value={inputMessage} onChange={(e) => setInputMessage(e.target.value)} />
                    <div className='rounded-full p-2' >
                        {/* <input type="file" className='hidden' id='uploadFile' onChange={(e) => handleUploadFileBtn(e)} /> */}
                        <input type="file" className='hidden' id='uploadFile'/>
                        <label htmlFor="uploadFile" className='cursor-pointer' >
                            <AiOutlinePaperClip size={20} className={''} />
                        </label>
                    </div>
                    <div className='rounded-full p-2 bg-[#36a1ea] cursor-pointer' onClick={() => handleSendMessage(inputMessage)}>
                        <FaTelegramPlane size={20} color={'white'} className={''} />
                    </div>
                </div>
                <div className='flex gap-2'>
                    {uploadFiles && uploadFiles.map(file => {
                        console.log(file)
                        
                        // if(file.file.type.includes('image')){
                        //     return <div className='w-[60px] h-[60px] rounded-md border-[1px] overflow-hidden' onClick={() => handleFildeDeleteBtn(file.fileUrl)}><img src={file.fileUrl} /></div>
                        // } else {
                        //     return <div className='w-[60px] h-[60px] rounded-md border-[1px] overflow-hidden' onClick={() => handleFildeDeleteBtn(file.fileUrl)}>File</div>
                        // }
                    })}
                </div>
            </div>
        </div>
        ) : (
            <div className='w-full h-full flex flex-col items-center justify-center'>
                <div className='w-[150px] h-[150px] rounded-full bg-[#36a1ea] flex items-center justify-center'>
                    <BsChatSquareTextFill size={50} color='white' />
                </div>
                <div className='text-[30px] pt-4'>Start Conversation </div>
            </div>
        )}
    </div>
  )
}

export default ChatPlace