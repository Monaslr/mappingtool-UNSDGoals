import { useLayoutEffect } from "react";

const ScrollToInteractiveChart = (elementRef)=>{
    useLayoutEffect(()=>{
            window.scrollTo({
                top: 650,
                behavior: "smooth" 
            })

    }, [elementRef])
}
export default ScrollToInteractiveChart;
