import { useEffect, useRef, useState } from "react";
import Container from "react-bootstrap/Container";
import { styled } from "styled-components";
import "../../style/ProjectInput.css";

const H2Text = styled.h2`
  text-align: left;
  font: 18px Helvetica Bold, sans-serif;
  font-weight: bold;
  color: #ba1fff;
  height: 30px;
  margin-top: 10px;
`;

const styles = {
  btn: {
    alignitems: "left",
    justifycontent: "left",
  },
};

const ProjectInput = ({
  userData,
  inputData,
  setInputData,
  errors,
  pName,
  setPName,
  pDesc,
  setPDesc,
  pTag,
  setPTag,
}) => {
  const [isExpanded, setIsExpanded] = useState(true);
  const toggleExpand = () => {
    setIsExpanded((prevState) => !prevState);
  };


  const calledAPI = useRef(false);
  useEffect(() => {
    if (!calledAPI.current) {
      calledAPI.current = true;
      setInputData(() => ({
        ...inputData,
        projectName: pName || "",
        projectDesc: pDesc || "",
        projectCategory: pTag || "",
      }));
    }
  }, [pName, pTag, pDesc, setInputData]);

  return (
    <Container>
      <H2Text>Project Input</H2Text>
      <div className="projectInput">
        <form
          style={{
            display: "flex",
            direction: "row",
            maxHeight: isExpanded ? "500px" : "0",
            overflow: "hidden",
            transition: "max-height 0.5s ease",
          }}
        >
          <div>
            <div className="formGroup">
              <label>Project Name:</label>
              <input
                className="inputItem"
                type="text"
                id="projectName"
                name="projectName"
                value={pName}
                onChange={(event) => {
                  const newValue = event.target.value;
                  setPName(newValue);
                  setInputData(() => ({ ...inputData, projectName: newValue }));
                }}
                required
              />
              {errors.projectName && (
                <p className="error" style={{ color: "red" }}>
                  {errors.projectName}
                </p>
              )}
            </div>
            <div className="formGroup">
              <label>Researcher Name:</label>
              <input
                className="inputItem"
                value={userData.userName}
                type="text"
                id="researcherName"
                name="researcherName"
              />
            </div>
            <div className="formGroup">
              <label htmlFor="projectCategory">Project Category:</label>
              <input
                className="inputItem"
                type="text"
                id="projectCategory"
                name="projectCategory"
                value={pTag}
                onChange={(event) => {
                  const newValue = event.target.value;
                  setPTag(newValue);
                  setInputData((prevData) => ({ ...prevData, projectCategory: newValue }));
                }}
                required
              />
              {errors.projectCategory && (
                <p className="error" style={{ color: "red" }}>
                  {errors.projectCategory}
                </p>
              )}
            </div>
          </div>
          <div className="formGroup projectDesc">
            <label>Project Description:</label>
            <textarea
              className="descArea"
              id="projectDesc"
              name="projectDesc"
              rows="4"
              value={pDesc}
              onChange={(event) => {
                const newValue = event.target.value;
                  setPDesc(newValue);
                  setInputData((prevData) => ({ ...prevData, projectDesc: newValue }));
              }}
              required
            ></textarea>
            {errors.projectDescription && (
              <p className="error" style={{ color: "red" }}>
                {errors.projectDescription}
              </p>
            )}
          </div>
        </form>
        <div style={styles.btn}>
          <button
            onClick={toggleExpand}
            className="btn btn-outline-info"
            style={{
              top: "30px",
              width: "80px",
              height: "30px",
            }}
          >
            {isExpanded ? "Collapse" : "Expand"}
          </button>
        </div>
      </div>
    </Container>
  );
};

export default ProjectInput;
