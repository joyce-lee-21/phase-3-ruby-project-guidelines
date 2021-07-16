import JobSeekersSideBarList from "./JobSeekersSideBarList";

function JobSeekersMatchSidebar({currentUser, onSideBarItemClick}) {
    return (
      <div className="JobSeekersMatchSidebar">
       <JobSeekersSideBarList currentUser={currentUser} 
                              onSideBarItemClick={onSideBarItemClick}/>
      </div>
    );
  }
  
  export default JobSeekersMatchSidebar;