import { useUI } from "../../../context/ui.context";
// import AddFolderView from "../../ModalViews/AddFolderView";
import AddFolderView from "../../ModalViews/AddFolderView";
import QuickSearchView from "../../ModalViews/QuickSearchView";
import FolderModalView from "../../ModalViews/FolderModalView";
import DownloadLinkView from "../../ModalViews/DownloadLinkView";
import Modal from "./Modal";


const ManagedModal = () => {
	const { showModal, closeModal, modalView } = useUI();
	return (
		<Modal open={showModal} onClose={closeModal}>
			{modalView === "ADD_FOLDER_VIEW" && <AddFolderView />}
			{modalView === "QUICK_SEARCH_VIEW" && <QuickSearchView />}
			{modalView === "FOLDER_MODAL_VIEW" && <FolderModalView />}
			{modalView === "DOWNLOAD_LINK_MODAL_VIEW" && <DownloadLinkView />}
		</Modal>
	);
};

export default ManagedModal;
