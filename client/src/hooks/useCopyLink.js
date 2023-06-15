import { useState } from "react";
import copy from "copy-to-clipboard";
 
export default function useCopyLink(resetInterval = null) {
  const [isCopied, setCopied] = useState(false);
 
  function handleCopy(text) {
    if (typeof text === "string" || typeof text == "number") {
      copy(text.toString());
      setCopied(true);
    } else {
      setCopied(false);
      console.error(
        `Cannot copy typeof ${typeof text} to clipboard, must be a string or number.`
      );
    }
  }
 
  return [isCopied, handleCopy];
}