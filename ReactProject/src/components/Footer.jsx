import React from 'react';
import styled from 'styled-components';


const FooterStyle  = styled.footer.attrs({
     className: "footer"
})`
    background-color: #f1f1f1;
    display: flex;
    align-items: center;
    justify-content: flex-start;
    font-size: 0.8rem;
    border-top: 1px solid #ccc;
    margin:0.5rem 0;
    padding: 10px 20px;
    text-align: center;
    width: 100%;
`;

const Paragraph = styled.p.attrs({
    className : "paragraph"
})`
    padding: 0rem;
    margin: 0rem;
`;

const LinkStyle  = styled.a.attrs({
    className: "footer-nav"
})`
    padding: 0rem 3rem;
    text-decoration: underline;
`;

const LocationStyle = styled.div.attrs({
    className: "footer-location"
})`
    margin:0rem;   
    display: flex;
    margin-left: auto;
    align-items: right;
    justify-content: center;
    padding-right: 1rem;
    
`;

const Footer = () => (
    <FooterStyle className="footer">
        <Paragraph className ="paragraph">Saskpolytech Mapping Tools</Paragraph>
        <LinkStyle className="footer-nav">
            <a href="/">Home |</a> 
            <a href="/view-project">View project |</a>  
            <a href="/about">About</a>
        </LinkStyle>
        <LocationStyle className="footer-location">
            <div>
                Contact: 123 Idywyld Drive, Saskatoon, Saskatchewan<br />
                Email: <a href="mailto:saskpolymappingTool@saskpolytech.ca">saskpolymappingTool@saskpolytech.ca</a>
            </div>
        </LocationStyle>
    </FooterStyle>
  
);

export default Footer;
