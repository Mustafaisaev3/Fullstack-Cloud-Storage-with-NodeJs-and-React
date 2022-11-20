import React, {createContext, useReducer, useMemo, useContext} from "react";

export const initialState = {
    showModal: false,
    modalView: 'ADD_FOLDER_VIEW',
    modalData: undefined,
    showUploader: false,
    displayConfirmationModal: false,
    confirmationModalView: "CONFIRMATION_MODAL_VIEW",
    confirmationModalData: null,
  
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

        case 'SET_MODAL_DATA':
            return {
                ...state,
                modalData: action.data
            }

        case 'OPEN_UPLOADER':
            return {
                ...state,
                showUploader: true
            }

        case 'CLOSE_UPLOADER':
            return {
                ...state,
                showUploader: false
            }

        case "OPEN_CONFIRMATION_MODAL":
            return {
                ...state,
                displayConfirmationModal: true,
            };

        case "CLOSE_CONFIRMATION_MODAL": 
            return {
                ...state,
                displayConfirmationModal: false,
            };

        case "SET_CONFIRMATION_MODAL_VIEW": 
            return {
                ...state,
                confirmationModalView: action.view,
            };

        case "SET_CONFIRMATION_MODAL_DATA": 
            return {
                ...state,
                confirmationModalData: action.data,
            };
        

        default:
            return state
    }
}

export const UIProvider = (props) => {
    const [state, dispatch] = useReducer(UIReducer, initialState);
  
  
    const openModal = () => dispatch({type: 'OPEN_MODAL'})
    const closeModal = () => dispatch({type: 'CLOSE_MODAL'})
    const setModalView = (view) => dispatch({type: 'SET_MODAL_VIEW', view})
    const setModalData = (data) => dispatch({type: 'SET_MODAL_DATA', data})
    const openUploader = () => dispatch({type: 'OPEN_UPLOADER'})
    const closeUploader = () => dispatch({type: 'CLOSE_UPLOADER'})

    const openConfirmationModal = () => dispatch({ type: "OPEN_CONFIRMATION_MODAL" });
    const closeConfirmationModal = () => dispatch({ type: "CLOSE_CONFIRMATION_MODAL" });
    const setConfirmationModalView = (view) => dispatch({ type: "SET_CONFIRMATION_MODAL_VIEW", view });
    const setConfirmationModalData = (data) => dispatch({ type: "SET_CONFIRMATION_MODAL_DATA", data });

  
    const value = useMemo(
      () => ({
        ...state,
        openModal,
        closeModal,
        setModalView,
        setModalData,
        openUploader,
        closeUploader, 
        openConfirmationModal,
        closeConfirmationModal,
        setConfirmationModalView,
        setConfirmationModalData,  
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