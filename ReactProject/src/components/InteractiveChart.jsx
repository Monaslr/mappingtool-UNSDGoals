import { Select, Radio } from "antd";
import { useState, useEffect, useRef } from "react";
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  LabelList,
  Label,
  RadialBarChart,
  RadialBar,
  RadarChart,
  Radar,
  PolarGrid,
  PolarAngleAxis,
  PolarRadiusAxis,
  PieChart,
  Pie,
  Cell,
  ResponsiveContainer,
  Rectangle,
  Sector,
} from "recharts";

// Style for chart
const styleForRadial = {
  top: "50%",
  right: 0,
  transform: "translate(80%, -50%)",
  lineHeight: "24px",
};


const goals = [
  { id: 1, goalName: "Goal 1", targets: 7 },
  { id: 2, goalName: "Goal 2", targets: 8 },
  { id: 3, goalName: "Goal 3", targets: 13 },
  { id: 4, goalName: "Goal 4", targets: 10 },
  { id: 5, goalName: "Goal 5", targets: 9 },
  { id: 6, goalName: "Goal 6", targets: 8 },
  { id: 7, goalName: "Goal 7", targets: 5 },
  { id: 8, goalName: "Goal 8", targets: 12 },
  { id: 9, goalName: "Goal 9", targets: 8 },
  { id: 10, goalName: "Goal 10", targets: 10 },
  { id: 11, goalName: "Goal 11", targets: 10 },
  { id: 12, goalName: "Goal 12", targets: 11 },
  { id: 13, goalName: "Goal 13", targets: 5 },
  { id: 14, goalName: "Goal 14", targets: 10 },
  { id: 15, goalName: "Goal 15", targets: 12 },
  { id: 16, goalName: "Goal 16", targets: 12 },
  { id: 17, goalName: "Goal 17", targets: 19 },
];

const fillColors = [
  "#e61f38",
  "#dcac34",
  "#4ba334",
  "#c4132b",
  "#fc341b",
  "#75d6ed",
  "#fcc404",
  "#a41343",
  "#fc6b23",
  "#dc0b64",
  "#fc9b1b",
  "#c38b2b",
  "#3b7c43",
  "#049bdc",
  "#54c424",
  "#046b9c",
  "#13436b",
];

const { Option } = Select;

// Calculate to show interactive chart
const InteractiveChart = ({ selectedTargets, chartData, setChartData }) => {
  const calledAPI = useRef(false);
  const [chartType, setChartType] = useState("bar");
  const [visualizationType, setVisualizationType] = useState("percentage");
  const [activeIndex, setActiveIndex] = useState(0);

  useEffect(() => {
    if (!calledAPI.current) {
      // 1. Calculate percentages for chart data
      const calculateChartData = (selectedTargets) => {
        // a. Calculate Percentage of Target in Goal
        const proportionalEachGoal = goals
          .map((goal, index) => {
            const selectedTargetsInGoal = selectedTargets.filter(
              (item) => item.goalId == goal.id
            );
            const goalPercentage =
              (selectedTargetsInGoal.length / goal.targets) * 100;
            return {
              goalId: goal.id,
              goalName: goal.goalName,
              goalPercentage: Math.round(goalPercentage),
              selectedTargetNums: selectedTargetsInGoal.length,
              fill: fillColors[index % fillColors.length],
            };
          })
          .filter((item) => item.goalPercentage > 0);

        // b. Calculate Percentage of Goal in Project
        // This comment is to remind for next development if the clien needs

        // c. Calculate Percentage of Target in Project
        // This comment is to remind for next development if the clien needs

        setChartData(proportionalEachGoal);
      };

      calculateChartData(selectedTargets);
    }
  }, [selectedTargets]);

  const onPieEnter = (_, index) => {
    setActiveIndex(index);
  };

  const customActiveShape = (props) => {
    const RADIAN = Math.PI / 180;
    const {
      cx,
      cy,
      midAngle,
      innerRadius,
      outerRadius,
      startAngle,
      endAngle,
      fill,
      payload,
    } = props;
    const sin = Math.sin(-RADIAN * midAngle);
    const cos = Math.cos(-RADIAN * midAngle);
    const sx = cx + (outerRadius + 10) * cos;
    const sy = cy + (outerRadius + 10) * sin;
    const mx = cx + (outerRadius + 30) * cos;
    const my = cy + (outerRadius + 30) * sin;
    const ex = mx + (cos >= 0 ? 1 : -1) * 22;
    const ey = my;
    const textAnchor = cos >= 0 ? "start" : "end";

    return (
      <g>
        <Sector
          cx={cx}
          cy={cy}
          innerRadius={innerRadius}
          outerRadius={outerRadius}
          startAngle={startAngle}
          endAngle={endAngle}
          fill={fill}
        />
        <Sector
          cx={cx}
          cy={cy}
          startAngle={startAngle}
          endAngle={endAngle}
          innerRadius={outerRadius + 6}
          outerRadius={outerRadius + 10}
          fill={fill}
        />
        <path
          d={`M${sx},${sy}L${mx},${my}L${ex},${ey}`}
          stroke={fill}
          fill="none"
        />
        <circle cx={ex} cy={ey} r={2} fill={fill} stroke="none" />
        <text
          x={ex + (cos >= 0 ? 1 : -1) * 12}
          y={ey}
          textAnchor={textAnchor}
          fill="#666"
        >
          {`${payload.goalName}`}
        </text>
        <text
          x={ex + (cos >= 0 ? 1 : -1) * 12}
          y={ey}
          dy={18}
          textAnchor={textAnchor}
          fill="#999"
        >
          {`(${payload.goalPercentage}%)`}
        </text>
      </g>
    );
  };

  const chartOptions = () => {
    switch (chartType) {
      case "bar":
        return (
          <ResponsiveContainer width={1080} height={600}>
            <BarChart
              data={chartData}
              barCategoryGap="100%"
              barGap={20}
              margin={{
                top: 5,
                right: 30,
                left: 20,
                bottom: 5,
              }}
            >
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="goalName" padding={{ left: 20, right: 20 }}>
                <Label position="bottom" />
              </XAxis>
              <YAxis padding={{ top: 20, bottom: 20 }} />
              <Tooltip />
              <Legend />
              <Bar
                dataKey="goalPercentage"
                fill="darkblue"
                activeBar={<Rectangle stroke="white" />}
                barSize={45}
              >
                <LabelList
                  dataKey="goalPercentage"
                  position="top"
                  style={{ fontWeight: "bold" }}
                />
              </Bar>
            </BarChart>
          </ResponsiveContainer>
        );
      
      case "radar":
        return (
          <RadarChart
            cx={380}
            cy={250}
            outerRadius={200}
            width={800}
            height={500}
            data={chartData}
          >
            <PolarGrid />
            <PolarAngleAxis
              dataKey="goalName"
              // tick={goalColorInRadar()}
              style={{ margin: 20 }}
            />
            <PolarRadiusAxis />
            <Radar
              name=""
              dataKey="goalPercentage"
              stroke="darkgoldenrod"
              fill="#ba1fff"
              fillOpacity={0.5}
            />
            <Tooltip />
            <Legend />
          </RadarChart>
        );
      case "pie":
        return (
          <ResponsiveContainer width={1080} height={600}>
            <PieChart>
              <Pie
                activeIndex={activeIndex}
                activeShape={customActiveShape}
                data={chartData}
                cx="50%"
                cy="50%"
                innerRadius={180}
                outerRadius={220}
                fill="#8884d8"
                dataKey="goalPercentage"
                onMouseEnter={onPieEnter}
              />
              <Tooltip />
              <Legend
                payload={chartData.map((goal) => ({
                  value: `${goal.goalName} : ${goal.goalPercentage}%`,
                  type: "square",
                  id: goal.goalId,
                  color: goal.fill,
                }))}
                iconSize={10}
                layout="vertical"
                verticalAlign="middle"
                // wrapperStyle={styleForRadial}
              />
            </PieChart>
          </ResponsiveContainer>
        );
      case "radial":
        return (
          <RadialBarChart
            style={{ margin: "30px" }}
            width={800}
            height={600}
            cx={400}
            cy={300}
            innerRadius={20}
            outerRadius={300}
            barSize={15}
            data={chartData}
          >
            <RadialBar
              minAngle={30}
              label={{
                position: "insideStart",
                fill: "#fff",
                formatter: (goalPercentage) => `${goalPercentage}%`,
              }}
              background
              clockWise
              dataKey="goalPercentage"
              fill={chartData.fill}
            />
            ;
            <Legend
              payload={chartData.map((goal) => ({
                value: `${goal.goalName} : ${goal.goalPercentage}%`,
                type: "square",
                id: goal.goalId,
                color: goal.fill,
              }))}
              iconSize={10}
              layout="vertical"
              verticalAlign="middle"
              wrapperStyle={styleForRadial}
            />
            <Tooltip />
          </RadialBarChart>
        );
      default:
        return null;
    }
  };

  return (
    <div>
      <div>
        <Select
          value={chartType}
          onChange={(value) => setChartType(value)}
          style={{ width: 200, marginLeft: 50 }}
        >
          <Option value="bar">Bar Chart</Option>
          <Option value="radar">Radar Chart</Option>
          <Option value="pie">Pie Chart</Option>
          <Option value="radial">Radial Bar Chart</Option>
        </Select>
        <Radio.Group
          onChange={(e) => setVisualizationType(e.target.value)}
          value={visualizationType}
          style={{ marginLeft: 20, marginTop: 20 }}
        >
          <Radio value="percentage" style={{ color: "darkviolet" }}>
            Percentage
          </Radio>
          {/* <Radio value="quantity" style={{ color: "darkviolet" }}>
            Quantity
          </Radio> */}
        </Radio.Group>
      </div>
      <div>
        {chartData.length > 0 && (
          <div>
            <h2
              style={{
                color: "darkgoldenrod",
                marginLeft: 50,
                marginTop: 30,
                marginBottom: 15,
              }}
            >
              SDG Contribution
            </h2>
            {chartOptions()}
          </div>
        )}
      </div>
    </div>
  );
};

export default InteractiveChart;
