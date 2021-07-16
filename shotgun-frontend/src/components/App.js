import logo from '../assets/logo.svg';
import '../assets/App.css';
import { 
  BrowserRouter as Router,
  Switch, 
  Route
} from "react-router-dom";
import {useHistory} from 'react-router'
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
  const [skillChange, setSkillChange] = useState(false)
  const [eventArr, setEventArr] = useState([])
  
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

  useEffect(()=>{
    fetch("http://localhost:9393/events")
    .then(res => res.json())
    .then(events => setEventArr(events) )
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
      //set currentUser
      setCurrentUser(isRecruiter)
      console.log("currentUserInAppWhenRecruiterLogin", currentUser, "isRecruiter", isRecruiter)
    } else if (isJobSeeker) {
      setUserStatus("jobseeker")
      console.log("isJobSeeker",isJobSeeker)
      setCurrentUser(isJobSeeker)

    } else {
      alert("Incorrect username or password, please re-enter.");
    }
  }

  //signup on SignUpJobSeeker.js
  const onJobSeekerSignUp = (enterSignUpName, enterSignUpUsername, enterSignUpLocation, enterSignUpPD, enterSignUpEmail, enterSignUpImage) => {
    // POST
    // console.log(enterSignUpName, enterSignUpLocation, enterSignUpUsername,  enterSignUpPD, enterSignUpEmail, enterSignUpImage)
    fetch("http://localhost:9393/jobseekers", {
    method: 'POST',
    headers:{
      'Content-Type': 'application/json'
    },
    body:JSON.stringify({enterSignUpName, enterSignUpUsername, enterSignUpLocation, enterSignUpPD, enterSignUpEmail, enterSignUpImage
    })
    })
    .then(res => res.json())
    .then(data => setCurrentUser(data))
    .then(setUserStatus("jobseeker"))

  }

  const onRecruiterSignUp = (enterSignUpName,  enterSignUpCompanyName, enterSignUpUsername, enterSignUpLocation, enterSignUpPD, enterSignUpEmail, enterSignUpLogo) => {
    console.log(enterSignUpName,  enterSignUpCompanyName, enterSignUpUsername, enterSignUpLocation, enterSignUpPD, enterSignUpEmail, enterSignUpLogo)
    fetch("http://localhost:9393/recruiters", {
      method: 'POST',
      headers:{
        'Content-Type': 'application/json'
      },
      body:JSON.stringify({enterSignUpName,  enterSignUpCompanyName, enterSignUpUsername, enterSignUpLocation, enterSignUpPD, enterSignUpEmail, enterSignUpLogo 
      })
      })
      .then(res => res.json())
      .then(data => setCurrentUser(data))
      .then(setUserStatus("recruiter"))
  }

  const onHeaderButtonClick = () => {
      setCurrentUser(null)
  }

  const onSkillChange = (bool) => {
    // console.log(bool)
    if (bool) {
      setCurrentUser(currentUser) 
    }
  }


  return (
    <div className="App">
      <Router>
        {/* <button onClick={history.push("/")}>yo</button> */}
        <Header currentUser={currentUser}
                setCurrentUser={onHeaderButtonClick}/>
        <Switch>
          <Route exact path="/">
            <Homepage />
          </Route>
          <Route path="/signup">
            <SignUp userStatus={userStatus} 
                    setUserStatus={setUserStatus} 
                    onJobSeekerSignUp={onJobSeekerSignUp}
                    onRecruiterSignUp={onRecruiterSignUp}
                    currentUser={currentUser}
                    />
          </Route>
          <Route path="/login">
            <Login onLoginSubmit={onLoginSubmit} currentUser={currentUser}/>
          </Route>
          <Route path="/matches">
            {userStatus === "recruiter" ? 
              <RecruitersMatchContainer currentUser={currentUser}/> 
              : 
              <JobSeekersMatchContainer currentUser={currentUser} 
                                        eventArr={eventArr}/>}
          </Route>
          <Route path="/profile">
            <ProfileContainer userStatus={userStatus}
                              currentUser={currentUser}
                              recruiterArr={recruiterArr}
                              jobseekerArr={jobseekerArr}
                              setSkillChange={onSkillChange}/>
          </Route>
          <Route path="/events">
            <EventsContainer userStatus={userStatus}
                              currentUser={currentUser}
                              recruiterArr={recruiterArr}
                              jobseekerArr={jobseekerArr}/>
          </Route>
        </Switch>
      </Router>
    </div>
  );
}

export default App;
