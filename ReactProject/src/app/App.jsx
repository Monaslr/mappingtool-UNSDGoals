import { useState } from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import NavBar from "../components/navbar/NavBar";
import "bootstrap/dist/css/bootstrap.css";
import ProjectCreate from "../views/ProjectCreate";
import ProjectUpdate from "../views/ProjectUpdate";
import ProjectList from "../views/view-project/ProjectList";
import ProjectSelection from '../views/view-project/ProjectSelection';
import About from "../views/About";
import Footer from "../components/Footer";
import Home from "../views/Home";
// import ProjectUpdate from "../views/ProjectUpdate";
import MyProjects from "../views/MyProjects";
import { styled } from 'styled-components'

// Define breakpoints
const breakpoints = {
  mobile: '767px',
  tablet: '1023px',
  desktop: '1080px'
};

// Create a styled component
const Container = styled.div`

  /* Styles for mobile devices */
  @media (max-width: ${breakpoints.mobile}) {
    padding: 10px;
  }

  /* Styles for tablets */
  @media (min-width: ${breakpoints.mobile}) and (max-width: ${breakpoints.tablet}) {
    padding: 10px;
  }

  /* Styles for desktops */
  @media (min-width: ${breakpoints.desktop}) {
    padding: 15px;
  }
`;

const App = () => {
  const [userData, setUserData] = useState([]);
  const [selectedTargets, setSelectedTargets] = useState([]);
  const [chartData, setChartData] = useState([]);
  const [inputData, setInputData] = useState({
    projectName: "",
    projectDesc: "",
    projectCategory: "",
    selectedTargets: [],
  });
  const [errors, setErrors] = useState({});
  const [pName, setPName] = useState("");
  const [pDesc, setPDesc] = useState("");
  const [pTag, setPTag] = useState("");
  const [user, setUser] = useState([]);

  return (
    <Container>
      <BrowserRouter>
        <NavBar userData={userData} setUserData={setUserData} />
        <Routes>
          <Route
            path="/project-create"
            element={
              <ProjectCreate
                userData={userData}
                selectedTargets={selectedTargets}
                setSelectedTargets={setSelectedTargets}
                chartData={chartData}
                setChartData={setChartData}
                inputData={inputData}
                setInputData={setInputData}
                errors={errors}
                setErrors={setErrors}
                pName={pName}
                setPName={setPName}
                pDes={pDesc}
                setPDesc={setPDesc}
                pTag={pTag}
                setPTag={setPTag}
                readOnly={true}
                isShowedButton={true}

              />
            }
          />

          <Route
            path="/project-update/:projectId"
            element={
              <ProjectUpdate
                userData={userData}
                selectedTargets={selectedTargets}
                setSelectedTargets={setSelectedTargets}
                chartData={chartData}
                setChartData={setChartData}
                inputData={inputData}
                setInputData={setInputData}
                errors={errors}
                setErrors={setErrors}
                pName={pName}
                setPName={setPName}
                pDesc={pDesc}
                setPDesc={setPDesc}
                pTag={pTag}
                setPTag={setPTag}
                readOnly={true}
                isShowedButton={true}
              />
            }
          />

          {<Route
            path="/project-update/:projectId/mappingview"
            element={
              <ProjectUpdate
                userData={userData}
                selectedTargets={selectedTargets}
                setSelectedTargets={setSelectedTargets}
                chartData={chartData}
                setChartData={setChartData}
                inputData={inputData}
                setInputData={setInputData}
                errors={errors}
                setErrors={setErrors}
                pName={pName}
                setPName={setPName}
                pDesc={pDesc}
                setPDesc={setPDesc}
                pTag={pTag}
                setPTag={setPTag}
                readOnly={false}
                isShowedButton={false}
              />
            }
          /> }
          <Route path="/View-Project" element={<ProjectList  user={user} setUser={setUser}/>} />
          <Route path="/projects/:id" element={<ProjectSelection user={user} setUser={setUser} />} />
          <Route path="/my-project" element={<MyProjects/>}/>
          <Route path="/about" element={<About />} />
          <Route path="/" element={<Home />} />
        </Routes>
        <Footer />
      </BrowserRouter>
    </Container>
  );
};

export default App;
