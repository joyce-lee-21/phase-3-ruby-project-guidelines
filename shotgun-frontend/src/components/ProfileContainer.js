import ProfileSkills from "./ProfileSkills";
import IconButton from "@material-ui/core/IconButton";
import Visibility from "@material-ui/icons/Visibility";
import VisibilityOff from "@material-ui/icons/VisibilityOff";
import { useState } from "react";

function ProfileContainer( {userStatus, currentUser, setSkillChange} ) {

    const [showPassword, setShowPassword] = useState(false)

    console.log(currentUser)
    return (
      <div className="profile-container">
        <div className="greeting-box">
            <h2>{`Hello, ${currentUser.name}`}</h2>
        </div>
        <div className="profile-content">
            <div className="user-details">
                <h2>User Details</h2>
                <div className="details-container">
                    <br></br>
                    <span className="user-details-text-box">
                        <h4>Name:</h4>
                        <p>{currentUser.name}</p>
                    </span>
                    <span className="user-details-text-box">
                        <h4>Location:</h4>
                        <p>{currentUser.location}</p>
                    </span>
                    <span className="user-details-text-box">
                        <h4>Username:</h4>
                        <p>{currentUser.username}</p>
                    </span>
                    <span className="user-details-text-box">
                        <h4>Password:</h4>
                        {/* <IconButton onClick={setShowPassword(!showPassword)}>
                            {showPassword ? <Visibility /> : <VisibilityOff />}
                        </IconButton> */}
                        <p>{currentUser.password}</p>
                    </span>
                    <span className="user-details-text-box">
                        <h4>Email:</h4>
                        <p>{currentUser.email}</p>
                    </span>
                </div>
            </div>
            <div className="skills-container">
                <h2>Skills</h2>
                    <ProfileSkills 
                        userStatus={userStatus} 
                        currentUser={currentUser}
                        setSkillChange={setSkillChange}
                    />
            </div>
        </div>
      </div>
    );
  }
  
  export default ProfileContainer;