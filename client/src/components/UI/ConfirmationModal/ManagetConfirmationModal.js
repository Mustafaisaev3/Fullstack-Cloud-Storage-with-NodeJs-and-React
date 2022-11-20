import { useUI } from "../../../context/ui.context";
import ConfirmationModal from "./ConfirmationModal";
import MainView from "./ConfirmationModalViews/MainView";



const ManagedConfirmationModal = () => {
	const { displayConfirmationModal, closeConfirmationModal, confirmationModalView } = useUI();
	return (
		<ConfirmationModal open={displayConfirmationModal} onClose={closeConfirmationModal}>
			{/* {confirmationModalView === "CONFIRMATION_MODAL_VIEW" && <MainView />} */}
			<MainView />
		</ConfirmationModal>
	);
};

export default ManagedConfirmationModal;
