import { Link } from "react-router-dom";
import { styled } from 'styled-components';

import { Nav} from "react-bootstrap";
import NavDropdown from 'react-bootstrap/NavDropdown';

//padding-left: 450px;
const List = styled.div.attrs({
    className: "navbar-nav me-auto"
})`
    display: flex;
    direction: row;
    margin-left: auto;
    align-content: right;
`;

const Links = () =>{
    return (
        <List>
          <Nav
            className="me-auto my-2 my-lg-0"
            style={{ maxHeight: '100px', alignContent: "right" }}
            navbarScroll
          >
            <Nav.Link as={Link} to="/" style={{alignContent: "right"}}>Home</Nav.Link>
            <NavDropdown title="Projects" id="navbarScrollingDropdown">
              <NavDropdown.Item as={Link} to="/project-create" >Create Project</NavDropdown.Item>
              <NavDropdown.Item as={Link} to="/view-project" >View Project</NavDropdown.Item>
              <NavDropdown.Item as={Link} to="/my-project" >My Project</NavDropdown.Item>
            </NavDropdown>
            <Nav.Link className="nav-link" as={Link} to="/about">About</Nav.Link>
          </Nav>
        </List>
    );
};

export default Links;

