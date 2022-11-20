import React, { useRef, useEffect } from "react";
import { Portal } from "react-portal";
import { IoClose } from "react-icons/io5";
import { useUI } from "../../../context/ui.context";
import useOnClickOutside from "../../../utils/use-click-outside";


const ConfirmationModal = ({
	children,
	open,
	onClose,
    rootClassName,
	useBlurBackdrop,
	containerClassName,
	variant = "center",
}) => {
	const { closeConfirmationModal } = useUI();
	const modalRootRef = useRef()
	const modalInnerRef = useRef() 
	useOnClickOutside(modalInnerRef, modalRootRef,() => closeConfirmationModal())

	const handleCloseModalBtn = (e) => {
		e.stopPropagation()
		onClose()
	}

	return (
		<Portal>
				{open && (
					<div
						ref={modalRootRef}
						key="modal"
						className={"modal-root fixed bg-black bg-opacity-70 inset-0 z-[10000] backdrop-blur-sm"}
					>
						
						<div
							className="relative h-full mx-auto w-full flex items-center justify-center"
						>
							<div
								className={"w-full md:w-auto absolute left-1/2 transform -translate-x-1/2 shadow-xl"}
							>
								<div
									ref={modalInnerRef}
									className=" h-full rounded-lg relative"
									style={{ maxHeight: "calc(100vh - 140px)" }}
								>
									{children}
                                    <button
                                        onClick={(e) => handleCloseModalBtn(e)}
                                        aria-label="Close panel"
                                        className={"absolute right-[-15px] top-[-15px] z-10 inline-flex items-center justify-center w-5 h-5 md:w-8 md:h-8 rounded-full bg-[#00c3ff] shadow text-gray-600 transition duration-200 focus:outline-none focus:text-gray-800 focus:shadow-md hover:text-gray-800 hover:shadow-md"}
                                    >
                                        <IoClose className="text-xl" color="white" />
                                    </button>
								</div>
							</div>
						</div>
					</div>
				)}
		</Portal>
	);
};

export default ConfirmationModal;
