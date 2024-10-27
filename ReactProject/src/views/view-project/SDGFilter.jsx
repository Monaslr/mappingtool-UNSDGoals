import React from 'react';
import styled from 'styled-components';

const SDGFilterWrapper = styled.div.attrs({

})`
    width: 100%;
    border: 1px solid #ccc;
    padding: 20px;
    background-color: #f9f9f9;
`;

const SDGFilterItem = styled.div.attrs({
    
})`
  margin-bottom: 5px;
  display: flex;
  align-items: center;
`;

const Checkbox = styled.input`
  margin-right: 10px;
`;

const Label = styled.label`
  white-space: nowrap;
`;



const SDGFilter = () => 
{
    const sdgs = Array.from({ length: 17 }, (_, i) => i + 1);
  
    return (
      <SDGFilterWrapper>
        <h3>Filters</h3>
        {sdgs.map(sdg => (
          <SDGFilterItem key={sdg}>
            <Checkbox type="checkbox" id={`sdg-${sdg}`} name={`sdg-${sdg}`} />
            <Label htmlFor={`sdg-${sdg}`}>SDG Goal {sdg}</Label>
          </SDGFilterItem>
        ))}
      </SDGFilterWrapper>
    );
};

  
export default SDGFilter;
