import JobSeekersSideBarItem from "./JobSeekersSideBarItem";

function JobSeekersSideBarList({currentUser, onSideBarItemClick}) {
    // console.log("currentUserInSideBarList", currentUser)
    return (
      <div className="job-seekers-side-bar-list">
        <ul>
            {
                currentUser.all_matching_recruiters.map((matchingRecruiter) => 
                    <JobSeekersSideBarItem key={matchingRecruiter.id}
                                           matchingRecruiter={matchingRecruiter}
                                           onSideBarItemClick={onSideBarItemClick}

                    
                    />)
            }
        </ul>
      </div>
    );
  }
  
  export default JobSeekersSideBarList;
