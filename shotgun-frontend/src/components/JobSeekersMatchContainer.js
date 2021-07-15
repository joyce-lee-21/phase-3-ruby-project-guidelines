import JobSeekersMatchSidebar from "./JobSeekersMatchSidebar";
import JobSeekersMatchFilter from "./JobSeekersMatchFilter";
import JobSeekersMatchEventList from "./JobSeekersMatchEventList";

function JobSeekersMatchContainer({currentUser}) {
    return (
      <div className="JobSeekersMatchContainer">
       <h1>JobSeekers Match Container!</h1>
        <JobSeekersMatchFilter />
        <JobSeekersMatchSidebar currentUser={currentUser}/>
        <JobSeekersMatchEventList currentUser={currentUser}/>
      </div>
    );
  }
  
  export default JobSeekersMatchContainer;