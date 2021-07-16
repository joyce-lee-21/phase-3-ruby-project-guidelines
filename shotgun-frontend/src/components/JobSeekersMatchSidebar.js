import JobSeekersSideBarList from "./JobSeekersSideBarList";

function JobSeekersMatchSidebar({currentUser, onSideBarItemClick}) {
    return (
      <div className="JobSeekersMatchSidebar">
       <h1>JobSeekers Match Sidebar!</h1>
       <JobSeekersSideBarList currentUser={currentUser} 
                              onSideBarItemClick={onSideBarItemClick}/>
      </div>
    );
  }
  
  export default JobSeekersMatchSidebar;