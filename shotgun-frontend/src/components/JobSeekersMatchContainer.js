import React, {useState}from 'react'
import JobSeekersMatchSidebar from "./JobSeekersMatchSidebar";
import JobSeekersMatchFilter from "./JobSeekersMatchFilter";
import JobSeekersMatchEventList from "./JobSeekersMatchEventList";

function JobSeekersMatchContainer({currentUser, eventArr}) {

  const [eventListOnDisplay, setEventListOnDisplay] = useState(currentUser.all_matching_events)

  // console.log("eventArrInContainer",eventArr)

  const onSideBarItemClick = (matchingRecruiter) => {
    // console.log("matching_recruiterInMatchContainer",matchingRecruiter.id)
    //setSelectedRecruiterEvent true => show flitered arry
    //filter the eventArr with matchingRecruiter 
    setEventListOnDisplay(eventArr.filter(event => event.recruiter.id == matchingRecruiter.id))
  }

  // console.log(eventListOnDisplay)
    return (
      <div className="JobSeekersMatchContainer">
       <h1>JobSeekers Match Container!</h1>
        <JobSeekersMatchFilter />
        <JobSeekersMatchSidebar currentUser={currentUser} 
                                onSideBarItemClick={onSideBarItemClick}
                                
                                />
        <JobSeekersMatchEventList eventListOnDisplay={eventListOnDisplay}
        />
      </div>
    );
  }
  
  export default JobSeekersMatchContainer;