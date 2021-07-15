import JobSeekersSideBarList from "./JobSeekersSideBarList";

function JobSeekersMatchSidebar({currentUser}) {
    return (
      <div className="JobSeekersMatchSidebar">
       <h1>JobSeekers Match Sidebar!</h1>
       <JobSeekersSideBarList currentUser={currentUser}/>
      </div>
    );
  }
  
  export default JobSeekersMatchSidebar;