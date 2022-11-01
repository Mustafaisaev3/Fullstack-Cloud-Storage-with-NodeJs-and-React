import { ImDropbox, ImGoogleDrive } from'react-icons/im'
import { SiMicrosoftonedrive } from'react-icons/si'

export const useStorageComponent = () => {
    const storages = {
        DropBox: <ImDropbox size={25} color={'#36a1ea'} />,
        GoogleDrive: <ImGoogleDrive size={25} color={'#36a1ea'} />,
        OneDrive: <SiMicrosoftonedrive size={25} color={'#36a1ea'} />,
    }

    return {storages}
}