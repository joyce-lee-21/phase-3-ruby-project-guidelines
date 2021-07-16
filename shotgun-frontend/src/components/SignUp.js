import React, {useState} from "react";
import SignUpRecruiter from "./SignUpRecruiter"
import SignUpJobSeeker from "./SignUpJobSeeker"
import SignUpInstructions from "./SignUpInstructions"



function SignUp({userStatus, setUserStatus, currentUser, setCurrentUser}) {

  

      if (userStatus === "none") {
        return <SignUpInstructions setUserStatus={setUserStatus}/>;

      } else if (userStatus === "recruiter") {
        return <SignUpRecruiter setUserStatus={setUserStatus} 
                                currentUser={currentUser}
                                setCurrentUser={setCurrentUser}
                                />;

    } else {
      return <SignUpJobSeeker setUserStatus={setUserStatus} 
                              currentUser={currentUser}
                              setCurrentUser={setCurrentUser}
                              />;

    }
}

export default SignUp;
