import RecruitersMatchListSkills from "./RecruitersMatchListSkills"

function RecruitersMatchList({matchingJobSeeker}) {
  console.log("matchingJobSeeker", matchingJobSeeker)
    return (
      <div >
       <li className="RecruitersMatchList">
         <div className="matching-job-seeker-photo">
            <img src={matchingJobSeeker.image} alt={matchingJobSeeker.name} />
          </div>
          <div className="matching-job-seeker-info">
            <h2>{matchingJobSeeker.name}</h2>
            <p>location: {matchingJobSeeker.location}</p>
            <p>email: {matchingJobSeeker.email}</p>
          </div>
          {/* < RecruitersMatchListSkills matchingJobSeeker={matchingJobSeeker}/> */}
        </li>
      </div>
    );
  }
  
  export default RecruitersMatchList;

  