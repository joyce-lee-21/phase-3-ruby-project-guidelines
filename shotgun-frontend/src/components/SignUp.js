import React, {useState} from "react";
import SignUpRecruiter from "./SignUpRecruiter"
import SignUpJobSeeker from "./SignUpJobSeeker"
import SignUpInstructions from "./SignUpInstructions"



function SignUp({userStatus, setUserStatus, onJobSeekerSignUp, onRecruiterSignUp}) {

  

      if (userStatus === "none") {
        return <SignUpInstructions setUserStatus={setUserStatus}/>;

      } else if (userStatus === "recruiter") {
        return <SignUpRecruiter setUserStatus={setUserStatus} onRecruiterSignUp={onRecruiterSignUp}/>;

    } else {
      return <SignUpJobSeeker setUserStatus={setUserStatus} onJobSeekerSignUp={onJobSeekerSignUp}/>;

    }
}

export default SignUp;
