import { useState, useEffect, useRef } from "react";
import apiCalls from "../api";
import { styled } from "styled-components";
import Button from "react-bootstrap/Button";
import Card from "react-bootstrap/Card";
import Indicator from "../components/SDGs/Indicator";
import InteractiveChart from "../components/InteractiveChart";
import ScrollToInteractiveChart from "../components/ScrollToInteractiveChart";
// import { RadarChart } from "recharts";
import RadarShow from '../components/SDGs/RadarShow';

const Div = styled.div.attrs({})`
  display: flex;
  flex-flow: column wrap;
  max-width: 1080px;
  border: 1px solid red;
  border-radius: 8px;
  margin: 0 auto;
  margin-top: 10px;
  align-items: center;
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
  font: 16px Helvetica Bold, sans-serif;
  font-weight: bold;
  color: #ba1fff;
  height: 30px;
  margin-top: 10px;
  text-align: left;
  padding-left: 20px;
  width: 1080px;
`;

const TargetContainer = styled.div`
  display: flex;
  flex-flow: row wrap;
  flex-shrink: 1;
  margin: 0 auto;
  margin-top: 10px;
  align-items: center;
  justify-content: center;
`;

const TargetView = ({
  clickedGoal,
  sdgIcons,
  selectedTargets,
  setSelectedTargets,
  chartData,
  setChartData,
}) => {
  const [targets, setTargets] = useState([]);
  const [clickedTarget, setClickedTarget] = useState(null);
  const [isChart, setIsChart] = useState([false]);
  const chartPositionRef = useRef(false);

  const calledAPI = useRef(false);

  useEffect(() => {
    if (!calledAPI.current) {
      apiCalls
        .getTargetsByGoal(clickedGoal)
        .then((res) => {
          let data = res.data.data;
          setTargets(
            data.map((item) => ({
              id: item.target_id,
              goalId: item.goal_id,
              targetName: item.target_name,
              desc: item.target_desc,
              createdDate: item.created_at,
            }))
          );
        })
        .catch((err) => {
          console.log(err);
        });
    }
  }, [clickedGoal, sdgIcons]);

  const hanldeClickedTarget = (targetId) => {
    setClickedTarget(targetId);
  };

  const handleSelectedTargets = (goalId, targetId, targetName) => {
    const targetExists = selectedTargets.some(
      (target) => target.targetId === targetId
    );
    if (targetExists) {
      setSelectedTargets(
        selectedTargets.filter((target) => target.targetId !== targetId)
      );
    } else {
      setSelectedTargets([
        ...selectedTargets,
        { goalId, targetId, targetName },
      ]);
    }
    setIsChart(true);
    window.scrollTo({
      top: chartPositionRef.current.offsetTop,
      behavior: "smooth",
    });
  };

  return (
    <Div>
      {clickedGoal && (
        <ScrollToInteractiveChart elementRef={chartPositionRef} />
      )}
      {isChart && (
        <InteractiveChart
          selectedTargets={selectedTargets}
          chartData={chartData}
          setChartData={setChartData}
        />
      )}
         {/* {isChart && (
        <RadarShow

        />
      )} */}
      {clickedTarget && (
        <div style={{ maxWidth: "1080px", height: "auto" }}>
          <Indicator target={clickedTarget} />
        </div>
      )}
      <div style={{ paddingLeft: "10px" }}>
        <H2Text>
          Targets: click on your desired target to choose indicator
        </H2Text>
      </div>
      <TargetContainer>
        {targets.map((target) => (
          <div key={target.id}>
            <Card
              style={{
                width: "330px",
                height: "200px",
                margin: "10px",
                padding: "0 0 15px 0",
                border: "1px solid black",
                font: "13 px Helvetica Bold, sans-serif",
                overflow: "hidden",
                display: "flex",
                flexDirection: "column",
                cursor: "pointer",
                backgroundColor: selectedTargets.some(
                  (item) => item.targetId === target.id
                )
                  ? "rgba(75, 192, 192, 0.2)"
                  : "white",
              }}
            >
              <Card.Body style={{ marginBottom: "15px" }}>
                <div style={{ display: "flex", alignItems: "center" }}>
                  <Card.Img
                    variant="top"
                    src={sdgIcons[clickedGoal - 1]}
                    style={{ width: "40px", height: "40px" }}
                    onClick={() =>
                      handleSelectedTargets(
                        clickedGoal,
                        target.id,
                        target.targetName
                      )
                    }
                  />
                  <Card.Title
                    style={{ padding: "0 15px" }}
                    onClick={() =>
                      handleSelectedTargets(
                        clickedGoal,
                        target.id,
                        target.targetName
                      )
                    }
                  >
                    Target {target.targetName}
                  </Card.Title>
                  <Button
                    onClick={() => hanldeClickedTarget(target.id)}
                    variant="outline-primary"
                    size="sm"
                    style={{ marginLeft: "auto" }}
                  >
                    Indicators
                  </Button>
                </div>
                <Card.Text
                  style={{
                    overflowY: "auto",
                    maxHeight: "200px",
                    padding: "15px 0px 20px 0px",
                  }}
                  onClick={() =>
                    handleSelectedTargets(
                      clickedGoal,
                      target.id,
                      target.targetName
                    )
                  }
                >
                  {target.desc}
                </Card.Text>
              </Card.Body>
            </Card>
          </div>
        ))}
      </TargetContainer>
    </Div>
  );
};

export default TargetView;
