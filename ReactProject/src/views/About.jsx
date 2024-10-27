import React from 'react';
import { Container } from 'react-bootstrap';
import styled from 'styled-components';
import Goal from '../components/SDGs/Goal';
import saklogo from '../components/assets/Saskatchewan_Polytechnic_Logo.png';


const Header = styled.h1.attrs({

})`
  text-align: center;
  margin-bottom: 20px;
  color: #4F2981;
  margin-top: 20px;
`;  


const Content = styled.div.attrs({
  className : "about-content"
})`
  display: flex;
  flex-direction: column;
  align-items: center;
`;
const ImageContainer = styled.div.attrs({
  className : "about-image"
})`
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 20px;
`;


const Image1 = styled.img.attrs({
  className : "about-image"
})`
width: 200px;
height: auto;
border-radius: 8px;
margin-right: 20px;
`;

const Text = styled.p.attrs({
  className : "about-text"
})`
  margin-top: 50px;
  max-width: 800px;
  text-align: justify;
  margin-bottom: 20px;
  
`;

const GoalD = styled.h2.attrs({

})`
  text-align: center;
  margin-top: 20px;
`;


const About = () => (
  <Container>
    <ImageContainer className="about-images">
        <Image1 src={saklogo} alt="SaskPolytech Research" />
    </ImageContainer>
    <Header>
    
      <h1>About Us</h1>
    </Header>
    <Content className="about-content" >
      <Text className="about-text" >
        <p>
          Welcome to the Saskatchewan Polytechnic (SaskPolytech) Mapping Tool. This platform is designed to facilitate researchers and their projects in alignment with the 17 Sustainable Development Goals (SDGs) set forth by the United Nations.
        </p>
        <p>
          Our mission is to support and showcase the research efforts of SaskPolytech researchers who are contributing to global sustainability through innovative projects. The mapping tool provides an interactive way to explore these projects and their impact on achieving the SDGs.
        </p>
        <p>
          At SaskPolytech, we believe in the power of education, research, and collaboration to drive positive change. By aligning our research initiatives with the SDGs, we are committed to addressing some of the most pressing challenges of our time, including poverty, inequality, climate change, environmental degradation, and peace and justice.
        </p>
        <p>
          The 17 SDGs, adopted by all United Nations Member States in 2015, are a universal call to action to end poverty, protect the planet, and ensure that all people enjoy peace and prosperity by 2030. Each goal has specific targets to be achieved over the next 15 years. You can learn more about the SDGs on the United Nations Sustainable Development Goals website.
        </p>
      </Text>
    </Content>
    <GoalD>
      <h2>17 United Nations Sustainability Development Goals</h2>
    </GoalD>
    <Goal />

  </Container>
);



export default About;
