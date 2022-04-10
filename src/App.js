import Content from './components/Content';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Dailiy from './views/Daily';
import Weekly from './views/Weekly';
import { useState } from 'react';
const App = () => {
  const [dailyquests, setdailyQuests] = useState([
    {
      name: 'Steal a car from a guy in the street',
      reward: '$1000',
    },
    {
      name: 'Steal a house from a guy in the street',
      reward: '$2000',
    },
    {
      name: 'Steal a boat from a guy in the street',
      reward: '$3000',
    },
  ]);
  return (
    <>
      <Content quests={dailyquests} setQuests={setdailyQuests} />
      <Router>
        <Routes>
          <Route path='/' element={<Dailiy />} />
          <Route path='/weeklu' element={<Weekly />} />
        </Routes>
      </Router>
    </>
  );
};

export default App;
