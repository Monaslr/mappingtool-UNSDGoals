import { useRef, useLayoutEffect } from "react";

const ScrollToTarget = ({elementRef})=>{
    useLayoutEffect(()=>{
            window.scrollTo({
                top: 1200,
                behavior: "smooth" 
            })

    }, [elementRef])
}
export default ScrollToTarget;
