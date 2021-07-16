// import '../assets/App.css';

function RecruitersMatchList({matchingJobSeeker}) {
  console.log("matchingJobSeeker", matchingJobSeeker)
    return (
      <div className="RecruitersMatchList">
       <li >
            <img src={matchingJobSeeker.image} alt={matchingJobSeeker.name} />
            <h2>{matchingJobSeeker.name}</h2>
            <p>location: {matchingJobSeeker.location}</p>
            <p>email: {matchingJobSeeker.email}</p>
            {/* <p>skills:</p> */}
        </li>
      </div>
    );
  }
  
  export default RecruitersMatchList;

  