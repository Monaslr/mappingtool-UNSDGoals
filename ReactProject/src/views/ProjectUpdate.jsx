import { useEffect, useRef, useState } from "react";
import apiCalls from "../api";
import ProjectForm from "../components/ProjectForm";
import { useParams } from "react-router-dom";

const ProjectUpdate = ({
  userData,
  selectedTargets,
  setSelectedTargets,
  chartData,
  setChartData,
  inputData,
  setInputData,
  errors,
  setErrors,
  pName,
  setPName,
  pDesc,
  setPDesc,
  pTag,
  setPTag,
  readOnly,
  isShowedButton
}) => {
  const { projectId } = useParams();

  const calledAPI = useRef(false);

  // Check empty of input
  const validate = () => {
    let newErrors = {};
    if (!inputData.projectName) {
      newErrors.projectName = "Please input project name";
    }
    if (!inputData.projectCategory) {
      newErrors.projectCategory = "Please input project category";
    }
    if (!inputData.projectDesc) {
      newErrors.projectDesc = "Please input project description";
    }
    return newErrors;
  };

  // Update project to the database
  const handleProjectUpdate = (
    projectName,
    projectDesc,
    userId,
    projectTag,
    selectedTargets
  ) => {
    const errorValidation = validate();
    const body = {
      projectName,
      projectDesc,
      userId,
      projectTag,
      selectedTargets,
    };

    if (Object.keys(errorValidation).length > 0) {
      setErrors(errorValidation);
      alert("Inputs are required!");
    } else {
      apiCalls
        .updateProject(projectId, body)
        .then(() => {
          alert("Project successfully updated");
          window.location.replace(`/my-project`);
          setSelectedTargets([]);
          setChartData([]);
          setInputData([]);
        })
        .catch((err) => {
          console.log(err);
        });
    }
  };

  useEffect(() => {
    if (!calledAPI.current) {
      calledAPI.current = true;
      apiCalls
        .getProjectsTargetsByProjectId(projectId)
        .then((res) => {
          let data = res.data.data;
          setPName(data[0].project_name || "");
          setPDesc(data[0].project_desc || "");
          setPTag(data[0].tag || "");
          const targets = data.map((item) => ({
            goalId: item.goalId,
            targetId: item.targetId,
            targetName: item.targetName,
          }));
          setSelectedTargets(targets);
        })
        .catch((error) => {
          console.log(error);
        });
    }
  }, []);

  return (
    <ProjectForm
      formType= {(isShowedButton ? "Update" : pName)}
      userData={userData}
      errors={errors}
      setErrors={setErrors}
      inputData={inputData}
      setInputData={setInputData}
      selectedTargets={selectedTargets}
      setSelectedTargets={setSelectedTargets}
      chartData={chartData}
      setChartData={setChartData}
      pName={pName}
      setPName={setPName}
      pDesc={pDesc}
      setPDesc={setPDesc}
      pTag={pTag}
      setPTag={setPTag}
      onSubmit={handleProjectUpdate}
      readOnly={readOnly}
      isShowedButton={isShowedButton}
    />
  );
};

export default ProjectUpdate;

