import React, {useState}from 'react'
import JobSeekersMatchSidebar from "./JobSeekersMatchSidebar";
import JobSeekersMatchFilter from "./JobSeekersMatchFilter";
import JobSeekersMatchEventList from "./JobSeekersMatchEventList";

function JobSeekersMatchContainer({currentUser, eventArr}) {

  const [eventListOnDisplay, setEventListOnDisplay] = useState(currentUser.all_matching_events)

  const onSearchChange=(input) => {
    console.log(input)
    setEventListOnDisplay(eventArr.filter(e=> 
      e.description.toLocaleLowerCase().includes(input.toLocaleLowerCase()) || 
      e.event_date.toLocaleLowerCase().includes(input.toLocaleLowerCase()) || 
      e.location.toLocaleLowerCase().includes(input.toLocaleLowerCase()) ||
      e.name.toLocaleLowerCase().includes(input.toLocaleLowerCase())
      ))
  }

  const onAllMatchingEventBtnClick = () => {
    setEventListOnDisplay(currentUser.all_matching_events)
  }

  const onSideBarItemClick = (matchingRecruiter) => {
    // console.log("matching_recruiterInMatchContainer",matchingRecruiter.id)
    //setSelectedRecruiterEvent true => show flitered arry
    //filter the eventArr with matchingRecruiter 
    setEventListOnDisplay(eventArr.filter(event => event.recruiter.id == matchingRecruiter.id))
  }

  // console.log(eventListOnDisplay)
    return (
      <div className="JobSeekersMatchContainer">
        <div className="greeting-box">
          <h2>{`Hello, ${currentUser.name}`}</h2>
        </div>
        <JobSeekersMatchFilter onSearchChange={onSearchChange}
                               onAllMatchingEventBtnClick={onAllMatchingEventBtnClick}
        />
        <div className="match-page-container">
          <JobSeekersMatchSidebar currentUser={currentUser} 
                                  onSideBarItemClick={onSideBarItemClick}
                                  
                                  />
          <JobSeekersMatchEventList eventListOnDisplay={eventListOnDisplay}
          />
        </div>
      </div>
    );
  }
  
  export default JobSeekersMatchContainer;