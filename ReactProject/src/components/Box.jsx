import React from "react";
// This file will contain the styling for the Box component
import styled from "styled-components";
import apiCalls from "../api";

const BoxDiv = styled.div`
  display: flex;
  direction: row;
  border: 1px solid #ccc;
  padding: 20px;
  margin: 20px;
  border-radius: 5px;
  box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.1);
`;


const Update = styled.input.attrs((props) => {
    return {
      type: "button",
      className: "btn btn-primary",
      id: props.projectId,
      value: "Update",
      onClick: updateProjectHandler,
    };
  })`
    cursor: pointer;
    text-align: center;
    padding: 0 px 10px;
    height: 35px;
    background: #046b9c;
    border: none;
  `;


  
  const updateProjectHandler = (e) => {
    window.location.replace(`/project-update/${e.target.id}`);
  };

  const deleteProjectHandler = (e) => {
    if (window.confirm("Are you sure you want to delete?")) {
      apiCalls
        .deleteProject(e.target.id)
        .then(window.location.reload())
        .catch((err) => {
          console.log(err);
        });
    }
  };

  
  const Delete = styled.input.attrs((props) => {
    return {
      type: "button",
      className: "btn btn-danger",
      id: props.projectId,
      value: "Delete",
      onClick: deleteProjectHandler,
    };
  })`
    cursor: pointer;
    text-align: center;
    padding: 0 px 10px;
    margin: 0px 15px;
    height: 35px;
    background: #fc6b23;
    border: none;
  `;

const Box = ({ project }) => {
  return (
    <BoxDiv className="box">
      <div style={{marginRight: "30px"}}>
        <h3 style={{color: "#ba1fff"}}>
          <span>{project.project_id}</span> {project.project_name}
        </h3>
        <div>{project.project_desc}</div>
      </div>
      <div style={{display: "flex", direction: "row", marginLeft: "Auto"}}>
        <Update projectId={project.project_id} />
        <Delete projectId={project.project_id}/>
      </div>
    </BoxDiv>
  );
};

export default Box;
