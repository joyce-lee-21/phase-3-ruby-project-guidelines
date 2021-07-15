import RecruitersMatchList from "./RecruitersMatchList";

function RecruitersMatchContainer({currentUser}) {
  console.log("currentUserInRecruiterMatchContainer", currentUser)
    return (
      <div className="RecruitersMatchContainer">
       <h1>Recruiters Match Container!</h1>
       {
        currentUser.all_matching_job_seekers.map(matchingJobSeeker => 
        <RecruitersMatchList key={matchingJobSeeker.id}
                             matchingJobSeeker={matchingJobSeeker}
        />)
      }
      </div>
    );
  }
  
  export default RecruitersMatchContainer;