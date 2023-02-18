import React, { useEffect, useState } from 'react'
import axios from 'axios'
import { useDispatch, useSelector } from 'react-redux'
import { setActiveCompanion, setActiveConversation } from '../../../store/ducks/chat/actions'
import { selectActiveCompanion, selectActiveConversation, selectActiveConversationMessages, selectChat } from '../../../store/ducks/chat/selectors'
import Input from '../../Input/Input'

const ChatLeftBar = ({currentUser, users }) => {
    const [conversations, setConversations] = useState([])
    const [messages, setMessages] = useState([])
    // const [activeCompanion, setActiveCompanion] = useState([])

    const activeCompanion = useSelector(selectActiveCompanion)
    const activeConversation = useSelector(selectActiveConversation)
    const activeConversationMessages = useSelector(selectActiveConversationMessages)

    const dispatch = useDispatch()
    useEffect(() => {
        console.log(activeCompanion)
    }, [activeCompanion])

    const getConversastions = async () => {
        const conversations = await axios.get(`http://localhost:5000/api/chat/conversations/?userId=${currentUser.id}`, {
            headers: {
                Authorization: `Bearer ${localStorage.getItem('token')}`
            }
        })

        setConversations(conversations.data)
        console.log(conversations.data)
        
    }
    
    const getMessages = async (conversationId, companion) => {
        setActiveConversation(conversationId)
        setActiveCompanion(companion)
        
        const messages = await axios.get(`http://localhost:5000/api/chat/messages/?conversationId=${conversationId}`, {
            headers: {
                Authorization: `Bearer ${localStorage.getItem('token')}`
            }
        })
        
        setMessages(messages.data.messages)
        // console.log(conversationId)
        console.log(companion)
        console.log(messages.data.messages)

        // console.log(messages.data)
        // setMessages(messages.data)
    }

    const handleConversationClick = async (conversationId) => {
        const conversation = await axios.get(`http://localhost:5000/api/chat/conversation/?conversationId=${conversationId}`, {
            headers: {
                Authorization: `Bearer ${localStorage.getItem('token')}`
            }
        })

        dispatch(setActiveConversation(conversation.data))
        console.log(conversation.data)
    }

    useEffect(() => {
        getConversastions()
    }, [])

    const handleUsersClick = (user) => {
        console.log(user)
        dispatch(setActiveCompanion(user))
        console.log(activeCompanion, 'activeCompanion')
    }


  return (
    <div className='w-[500px] h-full rounded-md bg-white'>
        <div>
            <div className='flex items-center gap-3 p-5 border-b-[1px]'>
                <div className='w-[50px] h-[50px] rounded-full bg-slate-400'></div>
                <div>
                    <div>{currentUser.email}</div>
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
                        {users && users.map(user => {
                            return  <div className='w-[50px] h-[50px] rounded-lg bg-slate-300 relative cursor-pointer' onClick={() => handleUsersClick(user)}>
                                        <div className='absolute right-0 bottom-0 w-3 h-3 border-[3px] border-white rounded-full bg-[#3cff26]'></div>
                                    </div>
                        })}
                        {/* <div className='w-[50px] h-[50px] rounded-lg bg-slate-300 relative'>
                            <div className='absolute right-0 bottom-0 w-3 h-3 border-[3px] border-white rounded-full bg-[#3cff26]'></div>
                        </div>
                        <div className='w-[50px] h-[50px] rounded-lg bg-slate-300 relative'>
                            <div className='absolute right-0 bottom-0 w-3 h-3 border-[3px] border-white rounded-full bg-[#3cff26]'></div>
                        </div>
                        <div className='w-[50px] h-[50px] rounded-lg bg-slate-300 relative'>
                            <div className='absolute right-0 bottom-0 w-3 h-3 border-[3px] border-white rounded-full bg-[#3cff26]'></div>
                        </div>
                        <div className='w-[50px] h-[50px] rounded-lg bg-slate-300'></div> */}
                    </div>
                </div>
            </div>

            <div className='w-full h-auto'>
                {conversations && conversations.map(conversation => {
                    // const myself = conversation.users[1]._id == currentUser.id
                    // const myself = false
                    // if(myself) {
                    //     return
                    // } else {
                        return  <div className='w-full h-auto'>
                                    {/* <div className='flex items-center gap-2 px-5 py-4 hover:bg-slate-200' onClick={() => getMessages(item._id, item.users[0])}> */}
                                    <div className='flex items-center gap-2 px-5 py-4 hover:bg-slate-200' onClick={() => getMessages(conversation._id)}>
                                        <div className='w-[40px] h-[40px] rounded-full bg-slate-400'></div>
                                        <div className='grow'>
                                            <div>{conversation.users[1].email}</div>
                                            {/* <div className='flex gap-1 items-center text-sm'>{item._id}</div> */}
                                        </div>
                                        <div className='text-sm h-full'>
                                        <div>10 min</div>
                                        </div>
                                    </div>
                                </div>
                    // }

                })}
                {activeConversationMessages && activeConversationMessages.map((message) => {
                    return <div>{message.message}</div>
                })}
                {/* <div className='w-full h-auto'>
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
                </div> */}
            </div>
        </div>
    </div>
  )
}

export default ChatLeftBar