import styled from 'styled-components';
import SasMap_Logo from '../assets/SasMap_Logo.png';
import { Navbar } from "react-bootstrap";

const LogoDiv = styled.div.attrs({

})`
    width: 100px;
    margin: 0 15px;;
    padding: 0;

`;

const Logo = () =>{
    return (
        <LogoDiv>
        <img src={SasMap_Logo} width="50" height="50" alt="logo" />
        </LogoDiv>
    );
};

export default Logo;
