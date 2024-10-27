import { useEffect } from "react";
import apiCalls from "../api";
import ProjectForm from "../components/ProjectForm";

const ProjectCreate = ({
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
  // Reset data for new project
  useEffect(() => {
    setSelectedTargets([]);
    setPName("");
    setPDesc("");
    setPTag("");
  }, [setSelectedTargets]);
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

  // Create project - insert new project to the database
  const handleProjectCreate = (
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
        .insertProject(body)
        .then(() => {
          alert("Project successfully added");
          setSelectedTargets([]);
          setChartData([]);
          setInputData([]);
        })
        .catch((err) => {
          console.log(err);
        });
    }
  };

  console.log("ProjectCreate->isShowedButton",isShowedButton);

  return (
    <ProjectForm
      formType="Create"
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
      onSubmit={handleProjectCreate}
      readOnly={readOnly}
      isShowedButton={isShowedButton}
    />
  );
};

export default ProjectCreate;
