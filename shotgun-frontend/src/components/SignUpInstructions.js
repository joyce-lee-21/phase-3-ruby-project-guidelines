import React from "react";


function SignUpInstructions({setUserStatus}) {

    return (
      <div className="sign-up-instructions-contianer">
        <h2 className="sign-up-header">Please select your signup</h2>
        <button className="sign-up-choice-btn" onClick={(e)=>setUserStatus("jobseeker")}>I'm a job seeker</button>
        <button className="sign-up-choice-btn" onClick={(e)=>setUserStatus("recruiter")}>I'm a recruiter</button>
      </div>
    )
  }
  
  export default SignUpInstructions;