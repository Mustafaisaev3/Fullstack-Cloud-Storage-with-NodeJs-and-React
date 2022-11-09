import { useUI } from "../../../context/ui.context";
// import AddFolderView from "../../ModalViews/AddFolderView";
import AddFolderView from "../../ModalViews/AddFolderView";
import Modal from "./Modal";


const ManagedModal = () => {
	const { showModal, closeModal, modalView } = useUI();
	return (
		<Modal open={showModal} onClose={closeModal}>
			{modalView === "ADD_FOLDER_VIEW" && <AddFolderView />}
		</Modal>
	);
};

export default ManagedModal;
