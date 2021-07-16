import RecruitersMatchList from "./RecruitersMatchList";

function RecruitersMatchContainer({currentUser}) {
  console.log("currentUserInRecruiterMatchContainer", currentUser)
    return (
      <div className="RecruitersMatchContainer">
        <div className="recruiters-match-seeker-h2">
          <h2>Here is your list of matching job seekers based on the skills you are looking for!</h2>
       </div>
       <ul >
        {
          currentUser.all_matching_job_seekers.map(matchingJobSeeker => 
          <RecruitersMatchList key={matchingJobSeeker.id}
                              matchingJobSeeker={matchingJobSeeker}
          />)
        }
      </ul>
      </div>
    );
  }
  
  export default RecruitersMatchContainer;