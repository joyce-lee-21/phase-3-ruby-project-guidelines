import JobSeekersSideBarItem from "./JobSeekersSideBarItem";

function JobSeekersSideBarList({currentUser}) {
    console.log("currentUserInSideBarList", currentUser)
    return (
      <div className="job-seekers-side-bar-list">
       <h1>JobSeekersSideBarList</h1>
        <ul>
            {
                currentUser.all_matching_recruiters.map((matchingRecruiter) => 
                    <JobSeekersSideBarItem key={matchingRecruiter.id}
                                           logo={matchingRecruiter.logo}
                                           companyName={matchingRecruiter.company_name}
                                           name={matchingRecruiter.name}
                                           email={matchingRecruiter.email}
                                           location={matchingRecruiter.location}
                    
                    />)
            }
        </ul>
      </div>
    );
  }
  
  export default JobSeekersSideBarList;
