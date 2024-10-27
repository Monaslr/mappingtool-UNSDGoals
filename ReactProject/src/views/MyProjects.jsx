import React, { useState, useEffect } from 'react';
import apiCalls from '../api/index';
import { useRef } from 'react';
import Box from '../components/Box';
import { styled } from 'styled-components';

const PageWrapper = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
`;
const ProjectListWrapper = styled.div.attrs({

})`
  display: flex;
  justify-content: space-between;
  width:100%;
  max-width:1200px;
`;

const ProjectsContainer = styled.div.attrs({

})`
  flex: 3;
  padding-right: 20px;
  display: flex;
  flex-direction: column;
`;

const ProjectsBorderWrapper = styled.div`
  border: 2px solid #ccc; 
  border-radius: 8px; 
  padding: 10px; 
  width:100%;
  display: flex;
  flex-direction: column;
  height: 100%;
`;
const FilterContainer = styled.div.attrs({

})`
  //padding-left:30px;
  margin-top: 0;
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
`;

const ProjectsWrapper = styled.div.attrs({

})`
  display: flex;
  flex-direction: column;
  gap: 10px;
  width:100%;
`;

const SearchBarWrapper = styled.div`
  display: flex;
  width: 100%;
  margin-bottom: 10px;
  align-items: center;
  //justify-content: space-between;
`;

const SearchBarContainer = styled.div`
  display: flex;
  flex: 1;
`;

const SearchBar = styled.input`
  flex: 1;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px 0 0 4px;
  height: 40px;
`;

const SearchButton = styled.button`
  padding: 10px 20px;
  background-color: purple;
  color: white;
  border: none;
  border-radius: 0 4px 4px 0;
  cursor: pointer;
  height: 40px;

  &:hover {
    background-color: darkviolet;
  }
`;


const InfoText = styled.p`
  margin-left: 20px;
  white-space: nowrap;
  display: flex;
  justify-content: space-between;
  width:100%;
  max-width:1200px;
`;


function MyProjects() {
    const [projects, setProjects] = useState([]);
    const [loading, setLoading] = useState(true);
  
    const calledApi = useRef(false);

    useEffect(() => {
        if(!calledApi.current){
            calledApi.current = true;
            apiCalls.getProjectByUser(3).then((res)=>{// hard coded user 3 for demo purposes
                setProjects(res.data.data);
                setLoading(false);
            }).catch((err)=>{console.log(err);})
        }
    });

    console.log(projects);

    return (
        <div>
        <ul>
            {projects.map(item => (
                
                <li style={{listStyle: "none"}} key={item.project_id}>
                    <Box project={item}/>
                </li>
            
            ))}
        </ul>
        </div>
        
    
    );

}

export default MyProjects;
