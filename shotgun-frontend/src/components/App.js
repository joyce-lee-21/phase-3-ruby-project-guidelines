import logo from '../assets/logo.svg';
import '../assets/App.css';
import { 
  BrowserRouter as Router,
  Switch, 
  Route,
  useHistory 
} from "react-router-dom";
import React, { useState, useEffect } from "react";

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
  const [userStatus, setUserStatus] = useState("none") //toggle among "none", "recruiter" and "jobseeker"
  const [currentUser, setCurrentUser] = useState(null)
  const [recruiterArr, setRecruiterArr] = useState([])
  const [jobseekerArr, setJobseekerArr] = useState([])
  

  const history = useHistory();

  //fetch
  useEffect(()=>{
    fetch("http://localhost:9393/recruiters")
    .then(res => res.json())
    .then(recruiters => setRecruiterArr(recruiters) )
    .catch(error => console.error('Error:', error))
  },[])

  useEffect(()=>{
    fetch("http://localhost:9393/jobseekers")
    .then(res => res.json())
    .then(jobseekers => setJobseekerArr(jobseekers) )
    .catch(error => console.error('Error:', error))
  },[])


  //Login submit on Login.js
  const onLoginSubmit = (enterLoginUsername, enterLoginPD) =>{
    console.log(enterLoginUsername, enterLoginPD)
    //verify 
    const isRecruiter = recruiterArr.find(r => r.username === enterLoginUsername && r.password === enterLoginPD) 
    const isJobSeeker = jobseekerArr.find(j => j.username === enterLoginUsername && j.password === enterLoginPD) 
    // console.log(isRecruiter, isJobSeeker)
    if (isRecruiter) {
      //set userStatus
      setUserStatus("recruiter")
      //push to match page
      history.push("/matches")
      //set currentUser
      setCurrentUser(isRecruiter)
    } else if (isJobSeeker) {
      setUserStatus("jobseeker")
      console.log("isJobSeeker",isJobSeeker)
      // history.push("/matches")
      setCurrentUser(isJobSeeker)
    } else {
      alert("Incorrect username or password, please re-enter.");
    }
  }
  //Login signup on SignUpJobSeeker.js
  const onJobSeekerSignUp = (enterSignUpUsername, enterSignUpEmail, enterSignUpName, enterSignUpLocation, enterSignUpPD) => {
    console.log(enterSignUpUsername, enterSignUpEmail, enterSignUpName, enterSignUpLocation, enterSignUpPD)
  }

  const onRecruiterSignUp = (enterSignUpUsername, enterSignUpEmail, enterSignUpName, enterSignUpCompanyName, enterSignUpLocation, enterSignUpPD) => {
    console.log(enterSignUpUsername, enterSignUpEmail, enterSignUpName, enterSignUpCompanyName, enterSignUpLocation, enterSignUpPD)
  }


  return (
    <div className="App">
      <Router>
        <Header></Header>
        <Switch>
          <Route exact path="/">
            <Homepage />
          </Route>
          <Route path="/signup">
            <SignUp userStatus={userStatus} 
                    setUserStatus={setUserStatus} 
                    onJobSeekerSignUp={onJobSeekerSignUp}
                    onRecruiterSignUp={onRecruiterSignUp}
                    />
          </Route>
          <Route path="/login">
            <Login onLoginSubmit={onLoginSubmit}/>
          </Route>
          <Route path="/matches">
            {userStatus === "recruiter" ? 
              <RecruitersMatchContainer /> 
              : 
              <JobSeekersMatchContainer currentUser={currentUser}/>}
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
