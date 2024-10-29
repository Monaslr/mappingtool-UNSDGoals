import React from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';


const CardDiv = styled.div.attrs({

})`
    width: 160px;
    height: 160px;
    border-radius: 4px;
    padding: 0px 0px 20px 0px;
    margin:6px 7px 6px 7px;
    align-items: center;
    justify-content: center;
    cursor: pointer

`;


const Img = styled.img`
    top: 50%;
    left: 50%;
    transform: (0, -50%);
    width: 160px;
    border-radius: 5px;
`;

const Card = ({mini_sdgi, index, onClick})=>{
    return (
        <CardDiv onClick={onClick} >             
            <Img src={mini_sdgi} alt={"SDG"} key={index} />
        </CardDiv> 
    )
}

export default Card;
