
import styled from 'styled-components';
import React, { useEffect, useState, useRef } from 'react';
import apiCalls from '../../api';
import { useNavigate } from 'react-router-dom';

const ProjectItemWrapper = styled.div
`
  padding: 10px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  flex-grow: 1; 
  cursor: pointer;
  border: 1px solid #ddd;
  margin-bottom: 10px;
`;

const InfoRow = styled.div
`
  display: flex;
  justify-content: space-between; 
  align-items: center;
  margin: 3px 0;
`;

const ProjectInfo = styled.div
`
  display: flex;
  align-items: center;

  label {
    font-weight: bold;
    margin-right: 10px;
  }

  span {
    margin-right: 20px;
  }
`;

const SdgSpanContainer = styled.div`
  display: flex;
  gap: 5px;
`;


const SdgSpan = styled.span.attrs(props => (
  {
    className: `sdg sdg-${props.sdg}`
  }))`
    display: inline-block;
    padding: 2px 5px;
    background-color: #eee;
    color: white;
    ${props => props.sdg === 1 && 'background-color: #e5243b;'}
    ${props => props.sdg === 2 && 'background-color: #dda63a;'}
    ${props => props.sdg === 3 && 'background-color: #4AA035;'}
    ${props => props.sdg === 4 && 'background-color: #C51128;'}
    ${props => props.sdg === 5 && 'background-color: #FF371A;'}
    ${props => props.sdg === 6 && 'background-color: #22bee3;'}
    ${props => props.sdg === 7 && 'background-color: #FDC404;'}
    ${props => props.sdg === 8 && 'background-color: #A31341;'}
    ${props => props.sdg === 9 && 'background-color: #FD6821;'}
    ${props => props.sdg === 10 && 'background-color: #DE0A67;'}
    ${props => props.sdg === 11 && 'background-color: #FE9D1D;'}
    ${props => props.sdg === 12 && 'background-color: #C08C27;'}
    ${props => props.sdg === 13 && 'background-color: #3D7E42;'}
    ${props => props.sdg === 14 && 'background-color: #0098DC;'}
    ${props => props.sdg === 15 && 'background-color: #56C026;'}
    ${props => props.sdg === 16 && 'background-color: #00679E;'}
    ${props => props.sdg === 17 && 'background-color: #12466A;'}
`;

const DescriptionRow = styled.div`
  margin: 3px 0;
`;

const ProjectItem = ({ project}) => 
{
  const [projectToSdgsMap, setProjectToSdgsMap] = useState({});
  const [user,setUser] = useState([]);
  const [selectedTargets, setSelectedTargets] = useState([]);
  const navigate = useNavigate();
  const calledAPI = useRef();
  const calledUserAPI = useRef({user:false});
  const handleClick = () => {
    navigate(`/projects/${project.project_id}`);
  };

  // Load data selectedTargets from database
  useEffect(() => 
    {
      if (!calledAPI.current) 
      {
        calledAPI.current = true;
        
        apiCalls.getProjectsTargetsByProjectId(project.project_id).then((res)=>
        {
          const data = res.data.data;
        
          if (data.length > 0) {
            const targets = data.map((item) => (
              {
                goalId: item.goalId,
                targetId: item.targetId,
                targetName: item.targetName,
                projectId: project.project_id
              }));
            setSelectedTargets(targets);

            // Load data into projectToSdgsMap dynamically
            const goalIdMap = {};
            targets.forEach(item => {
              const projectId = item.projectId;
              if (projectId === undefined) {
                console.warn('Undefined projectId found:', item); // for Debugging log
              } else {
                if (!goalIdMap[projectId]) {
                  goalIdMap[projectId] = [];
                }
                if (!goalIdMap[projectId].includes(item.goalId)) {
                  goalIdMap[projectId].push(item.goalId);
                }
              }
            });
            setProjectToSdgsMap(goalIdMap);
            

          } 
        }).catch((err)=>
          {
            console.error('Error fetching project targets:', error);
          });
      }
    },[project.project_id]);
    
    useEffect(() => 
      {
        if (!calledUserAPI.current.user) 
        {
          calledUserAPI.current.user= true;
          apiCalls.getUserById(project.user_id).then((res)=>
          {
            let data = res.data.data;
            setUser(data[0]);
          }).catch((err)=>{console.log(err);})
        }
      },[project.user_id]);

    const sdgs = projectToSdgsMap[project.project_id] || [];
    console.log("ProjectList->sdgs: ", sdgs);

    return (
      <ProjectItemWrapper onClick={handleClick}>
      <InfoRow>
        <ProjectInfo>
          <label>Project:</label>
          <span>{project.project_id}</span>
        </ProjectInfo>
        <SdgSpanContainer>
          {sdgs.map((sdg, index) => (
            <SdgSpan sdg={sdg} key={index}>{sdg}</SdgSpan>
          ))}
        </SdgSpanContainer>
      </InfoRow>
      <InfoRow>
        <ProjectInfo>
          <label>Researcher:</label>
          <span>{user.user_name}</span>
        </ProjectInfo>
      </InfoRow>
      <DescriptionRow>
        <label>Description:</label>
        <span>{project.project_desc}</span>
        <label>Tag: <span style={{fontWeight: 'normal'}}>{project.tag}</span> </label>
      </DescriptionRow>
    </ProjectItemWrapper>
    );
};
  
export default ProjectItem;
 
  
  
  
  
  
  
