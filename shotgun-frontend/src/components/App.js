import logo from '../assets/logo.svg';
import '../assets/App.css';
import { 
  BrowserRouter as Router,
  Switch, 
  Route 
} from "react-router-dom";
import React, { useState } from "react";

import SignUp from './SignUp';
import Login from './Login';
import Header from './Header';
import Homepage from './Homepage';
import JobSeekersMatchContainer from './JobSeekersMatchContainer';
import RecruitersMatchContainer from './RecruitersMatchContainer';
import ProfileContainer from './ProfileContainer';
import EventsContainer from './EventsContainer';


function App() {
  // CREATE STATE FOR THIS:
  let user_status = "Recruiter"

  return (
    <div className="App">
      <Router>
        <Header></Header>
        <Switch>
          <Route exact path="/">
            <Homepage />
          </Route>
          <Route path="/signup">
            <SignUp />
          </Route>
          <Route path="/login">
            <Login />
          </Route>
          <Route path="/matches">
            {user_status === "Recruiter" ? <RecruitersMatchContainer /> : <JobSeekersMatchContainer />}
          </Route>
          <Route path="/profile">
            <ProfileContainer />
          </Route>
          <Route path="/events">
            <EventsContainer />
          </Route>
        </Switch>
      </Router>
    </div>
  );
}

export default App;
