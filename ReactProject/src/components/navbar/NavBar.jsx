import Links from './Links';
import Logo from './Logo';
import UserAccount from './UserAccount';
import { styled } from 'styled-components';
import Search from './Search';
import { useEffect, useRef } from 'react';
import apiCalls from '../../api';

const Constainer = styled.div.attrs({
    className: "Container"
})``;


const Nav = styled.div.attrs({
    // className: "nav-bar"
})`

    background-color: #B5E2FA;  
    padding: 10px; 
    display: flex;
    align-items: center;
    justify-content: center;

`;

const NavBar = ({userData, setUserData})=>{
    const calledAPI = useRef(false);
    useEffect(() => {
        if (!calledAPI.current) {
          calledAPI.current = true;
    
          // Loading User by Id directly only for demonstration, not authenticated 
          // because we have not yet finalized which is way to do.
          // Example: userId = 3 (Researcher)
          apiCalls.getUserById(3).then((res)=>{
            let data = res.data.data;
            setUserData({
                userId: data[0].user_id,
                userName: data[0].user_name
            });
          }).catch((err)=>{console.log(err);})
    
        }
      },[userData]);

    return (
        <Constainer>
            <Nav>
                <Logo />
                <Links />
                <Search />
                <UserAccount userData={userData} setUserData={setUserData}/>
            </Nav>
        </Constainer>
    )
}

export default NavBar;
