import React, { useState, useEffect, useRef } from 'react';
import apiCalls from '../../api';


const Indicator = ({ target }) => {
  const [indicators, setIndicators] = useState([]);

  const calledAPI = useRef(false);
      useEffect(()=>{
        if (!calledAPI.current){
        apiCalls.getIndicatorsByTarget(target).then((res)=>{
          let data = res.data.data;
          setIndicators(data);
        }).catch((err)=>{console.log(err);})
        }
      }, [target]);
   
  return (
    <div>
      {indicators.map(indicator => (
        <div key={indicator.indicator_id} style={{ margin: '10px 25px', padding: '10px 20px', border: '1px solid #ba1fff', borderRadius: "5px" }}>
          <h5>Indicator {indicator.indicator_name}</h5>
          <p>{indicator.indicator_desc}</p>
        </div>
      ))}
    </div>
  );
};

export default Indicator;
