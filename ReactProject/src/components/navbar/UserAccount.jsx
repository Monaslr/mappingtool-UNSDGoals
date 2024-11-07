import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCaretDown} from '@fortawesome/free-solid-svg-icons';
import { faUser } from '@fortawesome/free-regular-svg-icons';
import { styled } from 'styled-components';


const UserDiv = styled.div.attrs({

})`
    display: flex;
    direction: row;
    margin: 0px 10px;
    pading: 0px 0px;
    align-items: center;
`;

const UserAccount = ({userData})=>{
  
//{userData[0].username
    return (
        
        <UserDiv>
            <FontAwesomeIcon icon={faUser} />
            <div style={{padding: "5px"}}>{userData.userName}</div>
            <FontAwesomeIcon icon={faCaretDown} />
        </UserDiv>
    );
};

export default UserAccount;
