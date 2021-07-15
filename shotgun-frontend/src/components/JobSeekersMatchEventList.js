import JobSeekersEventItem from "./JobSeekersMatchEventItem";

function JobSeekersMatchEventList({currentUser}) {
  console.log("currentUserInMatchEventList", currentUser.all_matching_events)
  return (
    <div>
      {currentUser.all_matching_events.map(matchingEvent => 
        <JobSeekersEventItem key={matchingEvent.id}
                             matchingEvent={matchingEvent}
        />)
      }
    </div>
  )
  }
  
  export default JobSeekersMatchEventList;

  //id, event-name, event-location, event-date, event-image, event-description
  //recruiter-name, recuiter-company-name