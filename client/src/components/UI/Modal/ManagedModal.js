import { useUI } from "../../../context/ui.context";
// import AddFolderView from "../../ModalViews/AddFolderView";
import AddFolderView from "../../ModalViews/AddFolderView";
import QuickSearchView from "../../ModalViews/QuickSearchView";
import FolderModalView from "../../ModalViews/FolderModalView";
import Modal from "./Modal";


const ManagedModal = () => {
	const { showModal, closeModal, modalView } = useUI();
	return (
		<Modal open={showModal} onClose={closeModal}>
			{modalView === "ADD_FOLDER_VIEW" && <AddFolderView />}
			{modalView === "QUICK_SEARCH_VIEW" && <QuickSearchView />}
			{modalView === "FOLDER_MODAL_VIEW" && <FolderModalView />}
		</Modal>
	);
};

export default ManagedModal;
