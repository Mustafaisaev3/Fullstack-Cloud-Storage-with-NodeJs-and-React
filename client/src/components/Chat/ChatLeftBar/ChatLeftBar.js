import React, { useEffect, useState } from 'react'
import axios from 'axios'
import { useDispatch, useSelector } from 'react-redux'
import { selectCurrentUser } from '../../../store/ducks/users/selectors'
import { setActiveCompanion, getUserConversations } from '../../../store/ducks/chat/actions'
import { selectActiveCompanion, selectActiveConversation, selectActiveConversationMessages, selectChat, selectAllUsers, selectUserConversations } from '../../../store/ducks/chat/selectors'
import Input from '../../Input/Input'

const ChatLeftBar = ({usersOnline, setActiveConversation }) => {
    const [messages, setMessages] = useState([])

    const currentUser = useSelector(selectCurrentUser)
    const conversations = useSelector(selectUserConversations)
    const activeCompanion = useSelector(selectActiveCompanion)
    const activeConversation = useSelector(selectActiveConversation)
    const activeConversationMessages = useSelector(selectActiveConversationMessages)

    const dispatch = useDispatch()

    useEffect(() => {
        dispatch(getUserConversations(currentUser.id))
    }, [])

    const users = useSelector(selectAllUsers)


  return (
    <div className='w-[400px] h-full rounded-md bg-white'>
        <div>
            <div className='flex items-center gap-3 p-5 border-b-[1px] h-[80px]'>
                <div className='w-[50px] h-[50px] rounded-full bg-slate-400'></div>
                <div>
                    {/* <div>{currentUser.email}</div> */}
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
                        {usersOnline && usersOnline.map(user => {
                            return <div className='w-[80px] flex flex-col items-center overflow-hidden' key={user._id}>
                                    <div className='w-[50px] h-[50px] rounded-lg bg-slate-300 relative cursor-pointer flex items-center justify-center'>
                                        <div>{user.email[0]}</div>
                                        <div className='absolute right-0 bottom-0 w-3 h-3 border-[3px] border-white rounded-full bg-[#3cff26]'></div>
                                    </div>
                                    <div className='w-full text-center pt-2'>{user.email}</div>
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
                    const companion = conversation.members.find(user => user._id !== currentUser.id)
                    return (
                        <div className='w-full h-auto' >
                            {/* <div className='flex items-center gap-2 px-5 py-4 hover:bg-slate-200' onClick={() => getMessages(item._id, item.users[0])}> */}
                            <div className='flex items-center gap-2 px-5 py-4 hover:bg-slate-200' onClick={() => setActiveConversation(conversation)}>
                                <div className='w-[40px] h-[40px] rounded-full bg-slate-400'></div>
                                <div className='grow'>
                                    <div>{companion.email}</div>
                                    {/* <div className='flex gap-1 items-center text-sm'>{item._id}</div> */}
                                </div>
                                <div className='text-sm h-full'>
                                <div>10 min</div>
                                </div>
                            </div>
                        </div>
                    )

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