import ProfileSkills from "./ProfileSkills";

function ProfileContainer( {userStatus, currentUser, recruiterArr, jobseekerArr} ) {
    console.log(currentUser)
    return (
      <div className="profile-container">
        <div className="greeting-box">
            <h2>{`Hello,`/* ${currentUser.name} */}</h2>
        </div>
        <div className="profile-content">
            <div className="user-details">
                <h2>User Details</h2>
                <div className="details-container">
                    <br></br>
                    <span className="user-details-text-box">
                        <h4>Name:</h4>
                        <p>CHANGE THIS</p>
                    </span>
                    <span className="user-details-text-box">
                        <h4>Location:</h4>
                        <p>CHANGE THIS</p>
                    </span>
                    <span className="user-details-text-box">
                        <h4>Username:</h4>
                        <p>CHANGE THIS</p>
                    </span>
                    <span className="user-details-text-box">
                        <h4>Password:</h4>
                        <p>CHANGE THIS</p>
                    </span>
                    <span className="user-details-text-box">
                        <h4>Email:</h4>
                        <p>CHANGE THIS</p>
                    </span>
                </div>
            </div>
            <div className="skills-container">
                <h2>Skills</h2>
                <div>
                    <ProfileSkills 
                        userStatus={userStatus} 
                        currentUser={currentUser} 
                        recruiterArr={recruiterArr} 
                        jobseekerArr={jobseekerArr}
                    />
                </div>
            </div>
        </div>
      </div>
    );
  }
  
  export default ProfileContainer;