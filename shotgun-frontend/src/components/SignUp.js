import React, {useState} from "react";
import SignUpRecruiter from "./SignUpRecruiter"
import SignUpJobSeeker from "./SignUpJobSeeker"
import SignUpInstructions from "./SignUpInstructions"



function SignUp() {
  const [whoSignUp, setWhoSignUp] = useState("n")

      if (whoSignUp === "n") {
        return <SignUpInstructions/>;

      } else if (whoSignUp === "r") {
        return <SignUpRecruiter />;

    } else {
      return <SignUpJobSeeker />;

    }
}

export default SignUp;