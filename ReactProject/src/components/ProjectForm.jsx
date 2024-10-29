import Card from "../components/Card";
import { styled } from "styled-components";
import { useState, useEffect, useRef } from "react";
import globallgoals from "../components/assets/globalgoals.png";
import Container from "react-bootstrap/Container";
import TargetView from "../components/SDGs/TargetView";
import apiCalls from "../api";
import ProjectInput from "../components/SDGs/ProjectInput";
import { Button } from "react-bootstrap";
import ScrollToTarget from "../components/ScrollToTarget";

const ProjectCreateDiv = styled.div.attrs({})`
  display: flex;
  flex-flow: column wrap;
  max-width: 1080px;
  margin: 0 auto;
  align-items: center;
  justify-content: center;
`;

const GoalBar = styled.div.attrs({})`
  display: flex;
  flex-flow: row;
  width: 100%;
  max-width: 1080px;
  padding: 15px 30px;
  background: #eddea4;
  color: #ba1fff;
  border-radius: 5px;
  text-align: center;
  height: 50px;
  font: 16px Helvetica, sans-serif;
  font-weight: bold;
`;
const GoalContent = styled.div.attrs({})`
  display: flex;
  flex-flow: row;
  width: 100%;
  max-width: 1080px;
  padding: 15px 30px;
  background: #eddea4;
  color: #ba1fff;
  border-radius: 5px;
  text-align: center;
  height: 50px;
  font: 16px Helvetica, sans-serif;
  font-weight: bold;
`;

const IconContainer = styled.div`
  display: flex;
  flex-flow: row wrap;
  flex-shrink: 1;
  background: #f9f7f3;
  margin: 0 auto;
  margin-top: 15px;
  align-items: center;
  justify-content: center;
`;

const H1Text = styled.h1`
  text-align: center;
  font: 25px Helvetica Bold, sans-serif;
  font-weight: bold;
  color: #ba1fff;
  height: 30px;
  margin-top: 15px;
`;

const H2Text = styled.h2`
  text-align: left;
  font: 18px Helvetica Bold, sans-serif;
  font-weight: bold;
  color: #ba1fff;
  height: 30px;
  margin-top: 10px;
`;

const styles = {
  mappingGuideCont: {
    maxwidth: "1080px",
    display: "grid",
    direction: "column",
    borderRadius: "8px",
    textAlign: "left",
    overflow: "hidden",
    background: "#fff",
    boxShadow: "0 0 10px rgba(0, 0, 0, 0.1)",
    transition: "max-height 0.5s ease",
  },

  mappingGuide1: {
    border: "1px solid red",
    margin: "10px",
    borderRadius: "8px",
    boxShadow: "0 2px 4px rgba(0, 0, 0, 0.1)",
    textAlign: "center",
    backgroundColor: "#fff",
  },
  mappingGuide: {
    border: "1px solid red",
    margin: "5px",
    borderRadius: "8px",
    boxShadow: "0 2px 4px rgba(0, 0, 0, 0.1)",
    textAlign: "center",
    backgroundColor: "#fff",
  },
  btn: {
    alignitems: "left",
    justifycontent: "left",
  },
};

const MapGuiding = () => {
  const [isExpanded, setIsExpanded] = useState(false);

  const toggleExpand = () => {
    setIsExpanded((prevState) => !prevState);
  };
  return (
    <Container style={styles.mappingGuideCont}>
      <H2Text>Mapping Guide</H2Text>
      <div
        className="row"
        style={{
          maxHeight: isExpanded ? "500px" : "0",
          overflow: "hidden",
          transition: "max-height 0.5s ease",
        }}
      >
        <div style={styles.mappingGuide1} className="col">
          <div>
            Step 1
            <p>
              Click on a tile representing a goal you wish to map to this
              project!
            </p>
          </div>
        </div>
        <div style={styles.mappingGuide1} className="col">
          <div>
            Step 2
            <p>
              Click on a target you think this project manages to address
              (whether just a little or a lot)!
            </p>
          </div>
        </div>
        <div style={styles.mappingGuide1} className="col">
          <div>
            Step 3
            <p>
              Tick the indicator(s) that you think this project definitely
              covers!
            </p>
          </div>
        </div>
      </div>
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
    </Container>
  );
};


const ProjectForm = ({
  formType,
  userData,
  errors,
  setErrors,
  inputData,
  setInputData,
  selectedTargets,
  setSelectedTargets,
  chartData,
  setChartData,
  pName,
  setPName,
  pDesc,
  setPDesc,
  pTag,
  setPTag,
  projectName,
  projectDesc,
  projectTag,
  onSubmit,
  readOnly,
  isShowedButton,
}) => {
  const [sdgIcons, setsdgIcons] = useState([]);
  const [selectedGoals, setSelectedGoals] = useState([]);
  const [clickedGoal, setClickedGoal] = useState(null);
  const targetPositionRef = useRef(null);
  const [selectedGoalId, setSelectedGoalId] = useState();

  const calledAPI = useRef(false);

  useEffect(() => {
    if (!calledAPI.current) {
      calledAPI.current = true;
      // Loading all goals
      apiCalls
        .getGoals()
        .then((res) => {
          let data = res.data.data;
          setSelectedGoals(
            data.map((item) => ({
              goalId: item.goal_id,
              goalName: item.goal_name,
              goalDesc: item.goal_desc,
              createdDate: item.created_at,
            }))
          );
        })
        .catch((err) => {
          console.log(err);
        });

      const importIcons = import.meta.glob(
        "../components/assets/Goals_17_SDGS/mini_sdg*.png"
      );
      const paths = Object.keys(importIcons).sort((a, b) => {
        const numA = parseInt(a.match(/mini_sdg(\d+)\.png/)[1]);
        const numB = parseInt(b.match(/mini_sdg(\d+)\.png/)[1]);
        return numA - numB;
      });

      Promise.all(
        paths.map((path) =>
          importIcons[path]().then((module) => module.default)
        )
      ).then(setsdgIcons);
    }
  }, [clickedGoal, userData]);

  const handleGoalClicked = (index) => {
    index = index + 1;
    setClickedGoal(index);
  };

  return (
    <ProjectCreateDiv>
      <H1Text>{formType} Project</H1Text>
      <MapGuiding />
      <ProjectInput
        userData={userData}
        errors={errors}
        inputData={inputData}
        setInputData={setInputData}
        pName={pName}
        setPName={setPName}
        pDesc={pDesc}
        setPDesc={setPDesc}
        pTag={pTag}
        setPTag={setPTag}
        projectName={projectName}
        projectDesc={projectDesc}
        projectTag={projectTag}
        readOnly={readOnly}
      />
      {(clickedGoal || Object.keys(selectedTargets).length > 0) && (
        <TargetView
          ref={targetPositionRef}
          clickedGoal={clickedGoal}
          sdgIcons={sdgIcons}
          selectedTargets={selectedTargets}
          setSelectedTargets={setSelectedTargets}
          chartData={chartData}
          setChartData={setChartData}
          selectedGoalId={selectedGoalId}
          setSelectedGoalId={setSelectedGoalId}
          readOnly={readOnly}
        />
      )}
      <div
        style={{
          display: "flex",
          direction: "row",
          maxwidth: "1080px",
          margin: "20px 10px",
        }}
      >
        {clickedGoal && (
          <GoalContent>
            <p>
              Goal {selectedGoals[clickedGoal - 1].goalId}:{" "}
              {selectedGoals[clickedGoal - 1].goalDesc}
            </p>
          </GoalContent>
        )}
        {!clickedGoal && (
          <GoalBar>
            <p>Click a goal below to begin mapping it to your project</p>
          </GoalBar>
        )}
        {(selectedGoalId &&  isShowedButton ) && (
          <Button
            type="button"
            value={`${formType} Project`}
            onClick={() => {
              onSubmit(
                inputData.projectName,
                inputData.projectDesc,
                userData.userId,
                inputData.projectCategory,
                selectedTargets
              );
            }}
            variant="btn btn-primary"
            size="sm"
            style={{
              marginLeft: "auto",
              width: "70px",
              height: "50px",
              margin: "0px 10px",
              background: "#ba1fff",
              border: "none",
              fontWeight: "bold",
            }}
          >
            {formType} Project
          </Button>
        )}
      </div>
      {<ScrollToTarget elementRef={targetPositionRef} />}
      <IconContainer>
        {sdgIcons.map((image, index) => (
          <div
            key={index}
            style={{ position: "relative", marginBottom: "20px" }}
          >
            <Card
              mini_sdgi={image}
              key={index}
              onClick={() => handleGoalClicked(index)}
            />
          </div>
        ))}
        <Card mini_sdgi={globallgoals} />
      </IconContainer>
    </ProjectCreateDiv>
  );
};

export default ProjectForm;
