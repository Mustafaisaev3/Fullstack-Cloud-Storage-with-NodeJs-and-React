import { useEffect, RefObject } from 'react'


export default function useOnClickOutside(
  InnerRef,
  RootRef,
  handler
) {
  useEffect(
    () => {
      const listener = (event) => {
        const el = InnerRef?.current
        if (!el || el.contains((event?.target) || null)) {
          return
        }
        handler(event);
      };

      if (RootRef || RootRef !== null) {
        RootRef?.current?.addEventListener('mousedown', listener);
        RootRef?.current?.addEventListener('touchstart', listener);
      } else {
        document.addEventListener('mousedown', listener);
        document.addEventListener('touchstart', listener);
      }

      return () => {
        if (RootRef || RootRef !== null) {
          RootRef?.current?.removeEventListener('mousedown', listener);
          RootRef?.current?.removeEventListener('touchstart', listener);
        } else {
          document.removeEventListener('mousedown', listener);
          document.removeEventListener('touchstart', listener);
        }
      };
    },
    [InnerRef, RootRef, handler]
  );
}