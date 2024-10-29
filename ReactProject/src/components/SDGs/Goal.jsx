import { useState, useEffect, useRef } from 'react';
import {styled} from 'styled-components';
import Card from '../Card';
import globallgoals from "../../components/assets/globalgoals.png";

const GoalIconDiv = styled.div.attrs({})`
  display: flex;
  flex-flow: column wrap;
  max-width: 1080px;
  margin: 0 auto;
  align-items: center;
  justify-content: center;
`;

const GoalIconContainer = styled.div`
  display: flex;
  flex-flow: row wrap;
  flex-shrink: 1;
  background: #f9f7f3;
  margin: 0 auto;
  margin-top: 15px;
  align-items: center;
  justify-content: center;
`;

const Goal = ()=>{
    const [sdgIcons, setsdgIcons] = useState([]);
    const calledAPI = useRef(false);

  useEffect(() => {
    if (!calledAPI.current) {
      calledAPI.current = true;

    // Import 17 goal icons
      const importIcons = import.meta.glob(
        "../../components/assets/Goals_17_SDGS/mini_sdg*.png"
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
      console.log("Goal->useEffect-> sdgIcons: ", sdgIcons);

    }
  }, []);

  const handleGoalClicked = (index) => {
    const sdgUrls = [
      'https://sdgs.un.org/goals/goal1',
      'https://sdgs.un.org/goals/goal2',
      'https://sdgs.un.org/goals/goal3',
      'https://sdgs.un.org/goals/goal4',
      'https://sdgs.un.org/goals/goal5',
      'https://sdgs.un.org/goals/goal6',
      'https://sdgs.un.org/goals/goal7',
      'https://sdgs.un.org/goals/goal8',
      'https://sdgs.un.org/goals/goal9',
      'https://sdgs.un.org/goals/goal10',
      'https://sdgs.un.org/goals/goal11',
      'https://sdgs.un.org/goals/goal12',
      'https://sdgs.un.org/goals/goal13',
      'https://sdgs.un.org/goals/goal14',
      'https://sdgs.un.org/goals/goal15',
      'https://sdgs.un.org/goals/goal16',
      'https://sdgs.un.org/goals/goal17',
    ];

    window.open(sdgUrls[index], '_blank');
  }

    return (
    <GoalIconDiv>
      <GoalIconContainer>
        {sdgIcons.map((image, index) => ( /**goals.map */
          <div key={index} style={{ position: 'relative', marginBottom: '20px' }}>
            <Card mini_sdgi={image} key={index} onClick={() => handleGoalClicked(index)}/>
          </div>
        ))}
        <Card mini_sdgi={globallgoals} />
      </GoalIconContainer>
      {/* <Footer /> */}
    </GoalIconDiv>
    );
};

export default Goal;
