

export const getFilesWithStructure = (allFiles) => {
    let parentFiles = []
    let childFiles = []
    
    const getAllFiles = async () => {
      if (allFiles !== undefined){
        allFiles.forEach((i) => {
          i.childFiles = []
          if (i.parent === null | !i.parent){
            parentFiles.push(i)
          } else {
            childFiles.push(i)
          }
        })
  
        const filterChildFiles = () => {
          childFiles.forEach(child => {
            parentFiles.forEach(parent => {
              if (child.parent == parent._id){
                parent.childFiles.push(child)
                childFiles = [...parent.childFiles.filter(i => i._id !== child._id)]
                parentFiles.push(child)
              }
            })
          })
          if (!childFiles.length) return
          // filterChildFiles()
        }
        
  
        filterChildFiles()
        parentFiles = parentFiles.filter(i => !i.parent)
    }
}

    getAllFiles()
    return parentFiles
}