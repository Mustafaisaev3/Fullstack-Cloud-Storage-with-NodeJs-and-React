import React, {createContext, useReducer, useMemo, useContext} from "react";

export const initialState = {
    showModal: false,
    modalView: 'ADD_FOLDER_VIEW',
}

export const UIContext = createContext(initialState);
UIContext.displayName = "UIContext";

export const UIReducer = (state = initialState, action) => {
    switch(action.type) {
        case 'OPEN_MODAL':
            return {...state, showModal: true}

        case 'CLOSE_MODAL':
            return {...state, showModal: false}

        case 'SET_MODAL_VIEW':
            return {
                ...state,
                modalView: action.view
            }

        default:
            return state
    }
}

export const UIProvider = (props) => {
    const [state, dispatch] = useReducer(UIReducer, initialState);
  
  
    const openModal = () => dispatch({type: 'OPEN_MODAL'})
    const closeModal = () => dispatch({type: 'CLOSE_MODAL'})
    const setModalView = (view) => dispatch({type: 'SET_MODAL_VIEW', view})

  
    const value = useMemo(
      () => ({
        ...state,
        openModal,
        closeModal,
        setModalView,
      }),
      [state]
    );
  
    return <UIContext.Provider value={value} {...props} />;
  }

export const useUI = () => {
    const context = useContext(UIContext);
    if (context === undefined) {
        throw new Error(`useUI must be used within a UIProvider`);
    }
    return context;
};

export const ManagedUIContext = ({ children }) => (
    <UIProvider>{children}</UIProvider>
);