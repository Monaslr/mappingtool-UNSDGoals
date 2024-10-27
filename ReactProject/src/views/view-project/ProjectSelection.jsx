import React, { useEffect, useState, useRef } from 'react';
import axios from 'axios';
import apiCalls from '../../api';
import { useParams } from 'react-router-dom';
import styled from 'styled-components';
import { useNavigate } from 'react-router-dom';

const ProjSelect = styled.div.attrs({

})`
    padding: 20px;
    margin-left: 25px;

`;

const Header = styled.h1.attrs({

})`
    font-size: 24px;
    margin: 10px 0;
`;

const HStyle = styled.h2.attrs({

})`
    font-size: 20px;
    margin: 10px 0;
    padding:10px 0;
`;

const Proj = styled.p.attrs({

})`
    border: 1px solid gray;
    border-radius: 10px;
    height:500px;
    width:90%;
    font-size: 16px;
    margin: 10px 0;
    overflow-y: auto; 
    padding: 10px;
    scroll-behavior: smooth;

`;

const Text = styled.p`
    text-align: center;
    margin: 0;
`;

const Icon = styled.img `
    width: 20px;
    height: 20px;
    margin-left: 10px;
`;

const Nav = styled.button`
    display: inline-block;
    margin-top: 20px;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    background-color: #b0bdc2;
    color: black;
    border: none;

    border-radius: 5px;
    transition: background-color 0.3s;

    &:hover 
    {
        background-color: #B5E2F9;
    }
    display: flex;
    justify-content: space-between;
`;

const Map = styled.button`
    display: inline-block;
    margin-top: 20px;
    margin-left: 10px;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    background-color: #b0bdc2;
    color: black;
    border: none;
    border-radius: 5px;
    transition: background-color 0.3s;

    &:hover 
    {
        background-color: #B5E2F9;
    }
    align-items: center;
`;

const FlexContainer = styled.div`
    display: flex;
    align-items: center;
    display: flex;
    justify-content: flex-end;
    margin-top: 20px;
    width: 82%;
`;

const ButtonContainer = styled.div`
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    margin-top: 20px;
    margin-bottom: 10px;
    width: 83%;
`;

const Div = styled.div`
    padding: 20px;
    margin-left: 25px;
`;


const ProjectSelection = () =>
{
    const { id } = useParams();
    const [project, setProject] = useState([]); 
    const [user, setUser] = useState([]);
    const [userId, setUserId] = useState([]);
    const [loading, setLoading] = useState(true);
    const navigate = useNavigate();
    const calledAPI = useRef(false);
    const calledUserAPI = useRef({user: false});
    useEffect(() => 
    {
        
        // axios.get(`http://localhost:3001/api/projects/${id}`)
        if(!calledAPI.current)
            {
                calledAPI.current = true;
                apiCalls.getProjectById(id).then((response) => {
                    console.log('Project data:', response.data.data);
                    setProject(response.data.data);
                    console.log('Project data[0]:', response.data.data[0]);
                    console.log("response.data.data[0].user_id:142", response.data.data[0].user_id);
                    setUserId(response.data.data[0].user_id);
                    setLoading(false);
                })
                .catch(error => {
                    console.error('Error fetching projects:', error);
                    setLoading(false);
                });
            }


    },[id]);

 
    
    
    console.log('typeof UserId:', userId);


    useEffect(()=>{
        if(!calledUserAPI.current.user){
            calledUserAPI.current.user = true;
            apiCalls.getUserById(userId).then((res)=>{
                console.log('User data:', res.data.data);
                setUser(res.data.data)
            }).catch((error)=>{console.log(error);})
        }
        
    }, [id])

    if (loading) 
    {
        return <div>Loading...</div>;
    }

    const handleClick = () => {
        navigate(`../view-project`);
    };

    const mappingViewHandler = (projectId) => {
        window.location.replace(`/project-update/${projectId}/mappingview`);
        readOnly = true;
    }

    return(
        <Div>
        <ProjSelect>
            <Header>Project {id}</Header>
            <HStyle> Researcher name: {user.user_name}</HStyle>
            <Proj>
                {project[0].project_desc}
            </Proj>
        </ProjSelect>
            <FlexContainer>
                <Text> Click Here to see the how this project maps to the SDGs! </Text>
                <Icon src='https://static.thenounproject.com/png/2055260-200.png' alt='point to button' />
                <Map onClick={() => {mappingViewHandler(id)}}> Mapping </Map>
            </FlexContainer> 
            <ButtonContainer>
            <Nav onClick={handleClick}> Back to list </Nav>
            </ButtonContainer>
        </Div>
    );
};

export default ProjectSelection;
