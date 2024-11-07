import { useState } from 'react';
import { styled } from 'styled-components';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons';
import Button from 'react-bootstrap/Button';

const Div = styled.div.attrs({

})`
    display: flex;
    align-items: center;
    margin: 0 15px;
`;

const SearchDiv = styled.div.attrs({

})`
    display: flex;
    direction: row;
    height: 31px;
    align-items: center;
    justify-content: center;
    background: white;
    margin: 0 10px;
    border: none;
    border-radius: 5px;
    padding: 0 8px;
    
`;

let searchWidth ;
const Input = styled.input.attrs({
})`
    border: none;
    outline-style: none;
    margin-left: 10px;
    height: 30px;
    transition: 'width 0.3s ease';
`;

const Search = () =>{

    const [isExpanded, setIsExpanded] = useState();

    const handleFocus = ()=>{
        setIsExpanded(true);
    };

    const handleBlur = ()=>{
        setIsExpanded(false);
    };

    return (
        <Div>
            <SearchDiv>
                <FontAwesomeIcon icon={faMagnifyingGlass} />
                <Input type="text" 
                    onFocus={handleFocus}
                    onBlur={handleBlur}
                    style={{ width: searchWidth = isExpanded ? '200px' : '50px' }}
                ></Input>
            </SearchDiv>
            <Button variant="outline-primary" size="sm">Search</Button>
        </Div>
    );
};

export default Search;
