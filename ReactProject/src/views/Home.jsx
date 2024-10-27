import React from 'react';
import Goal from '../components/SDGs/Goal';
import Saskpoly from '../components/assets/Saskatchewan_Polytechnic_Logo.png';
import Unlogo from '../components/assets/globalgoals.png';

const Home = () => {
    return (
        <div style={{ width: "1080px", height: "auto", border: "1px solid red", margin: "0 auto", textAlign: "center" }}>
            <h1>Mapping Tool</h1>
            <img src={Saskpoly} alt=""  />  
            <img src={Unlogo} alt=""  />
            <p>Saskatchewan Polytechnic is proudly partnered with the Canadian Govt in supporting the 17 UN Sustainable Development Goals. To ensure our commitment, we endeavor to track how well our projects align with these.</p>
            <p>This tool allows us to transparently showcase each project's contribution to and so we invite you to explore the ones that matter most to you and keep track of how they are helping to improve global sustainability!</p>
            <Goal />
        </div>
    );
};


export default Home;
