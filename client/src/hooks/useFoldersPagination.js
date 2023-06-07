import { useState, useEffect } from "react";
import { getFiles } from '../services/FilesService'

function useFoldersNavigation(id) {
    const [currentData, setCurrentData] = useState(null);
    const [currentFolderPointer, setCurrentFolderPointer] = useState(0);
    // const [currentFolder, setCurrentFolder] = useState(id);
    const [foldersIdsStack, setFoldersIdsStack] = useState([id]);

    const fetchFolderFiles = async (folderId = id) => {
        const folderFilesData = await getFiles(folderId)
        setCurrentData(folderFilesData)
    }

    useEffect(() => {
        fetchFolderFiles(foldersIdsStack[currentFolderPointer])
    }, [foldersIdsStack, currentFolderPointer])

    const isNext = () => {
        return foldersIdsStack[currentFolderPointer + 1]
    }

    const isPrev = () => {
        return foldersIdsStack[currentFolderPointer - 1]
    }

    const next = () => {
        if (isNext()) {
            setCurrentFolderPointer((prev) => prev + 1)
        }
    }
    
    const prev = () => {
        if (currentFolderPointer === 0) {
            return
        } else {
            setCurrentFolderPointer((prev) => prev - 1)
        }
    }

    const open = (folderId) => {
        setCurrentFolderPointer((prev) => prev + 1)
        // setFoldersIdsStack((prev) => [...prev, folderId])
        setFoldersIdsStack([...foldersIdsStack, folderId])
    }

    if(!id) {
        return
    }


    return { currentData, prev, next, open, isNext, isPrev };
}

 export default useFoldersNavigation;