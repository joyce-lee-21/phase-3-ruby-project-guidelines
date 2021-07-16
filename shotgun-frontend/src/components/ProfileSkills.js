import React, { useState } from "react";
import TextField from '@material-ui/core/TextField';
import Button from '@material-ui/core/Button';
import { makeStyles, createTheme } from '@material-ui/core/styles';

const theme = createTheme({
    palette: {
      primary: {
        main: '#94aac4',
      }
    },
  });
  
  
const useStyles = makeStyles((theme) => ({
    paper: {
      marginTop: theme.spacing(8),
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
    },
    avatar: {
      margin: theme.spacing(1),
      backgroundColor: theme.palette.secondary.main,
    },
    form: {
      width: '100%', // Fix IE 11 issue.
      marginTop: theme.spacing(1),
    },
    submit: {
      margin: theme.spacing(3, 0, 2),
    },
  }));

function ProfileSkills({userStatus, currentUser, setSkillChange}) {

    const [userSkills, setUserSkills] = useState(currentUser.skills)
    const [skillView, setSkillView] = useState("view") //"view", "add", "edit"
    const [skillName, setSkillName] = useState("")
    const [skillId, setSkillId] = useState(0)
    const [skillLevel, setSkillLevel] = useState(3)

    const classes = useStyles();

    // delete from server - DONE!!
    const handleDelete = (skill_id) => {
        fetch("http://localhost:9393/skills", {
            method: "DELETE",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                id: skill_id
            })
        })
        setUserSkills(userSkills.filter(skill => skill.id !== skill_id))
    }

    // edit form view - DONE!!
    const handleEdit = (skill_id, skill_name, skill_level) => {
        // console.log(skill_id)
        setSkillView("edit")
        setSkillId(skill_id)
        setSkillName(skill_name)
        setSkillLevel(skill_level)
    }

    // console.log(skillId, skillName, skillLevel)
    console.log(userSkills)
    // patch to server - DONE!!
    const handleEditSave = (e) => {
        e.preventDefault()
        let updated_skill = {
            id: skillId,
            profile_id: currentUser.skills[0].profile_id,
            name: skillName, 
            level: skillLevel
        }
        fetch("http://localhost:9393/skills", {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(updated_skill)
        })
        .then(res => res.json())
        .then(data => 
            {let skill_updated = data.patch_skill;
            setUserSkills(userSkills.map(skill => {
                if (skill.id === skill_updated.id) {
                    return {
                        id: skill_updated.id,
                        profile_id: skill_updated.profile_id,
                        name: skill_updated.name, 
                        level: skill_updated.level
                    }
                } else {
                    return skill
                }
            }))}
        )
        setSkillView("view")
    }
    
    const handleAdd = () => {
        setSkillView("add")
    }
    // form view + patch to server - DONE!!
    const handleAddSave = (e) => {
        e.preventDefault()
        
        let new_skill = {
            name: skillName, 
            level: skillLevel,
            profile_id: currentUser.skills[0].profile_id
        }

        fetch("http://localhost:9393/skills", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(new_skill)
        })
        .then(data => console.log(data))

        setUserSkills([...userSkills, new_skill])
        setSkillChange(true)
        setSkillView("view")
        // console.log([...userSkills, new_skill])
    }


    return (
        <>
        {/* if view is view */}
        {skillView === "view"
        ? <div className="ProfileSkills">
            {userSkills.map((skill) =>
                (<span className="skills-details-box">
                    <h4>{skill.name}</h4> 
                    <h4>Skill Level:</h4> 
                    <p>{skill.level}</p>
                    <button className="edit-skill" onClick={() => handleEdit(skill.id, skill.name, skill.level)}>Edit</button>
                    <button className="delete-skill" onClick={() => handleDelete(skill.id)}>Delete</button>
                </span>)
            )}
            <span className="skills-details-box">
                <button className="add-skill" onClick={() => handleAdd()}>Add</button>
            </span>
        </div>
        : skillView === "add"
        // if view is add
        ? <div className="ProfileSkills">
            {/* form here */}
                <form className={classes.form} noValidate onSubmit={handleAddSave}>
                    <TextField
                    variant="outlined"
                    margin="normal"
                    required
                    fullWidth
                    id="skillname"
                    label="Skill Name: "
                    name="skillname"
                    autoFocus
                    onChange={(e)=>{setSkillName(e.target.value)}}
                    value={skillName}
                    />
                    <TextField
                    variant="outlined"
                    margin="normal"
                    required
                    fullWidth
                    name="level"
                    label="Skill Level: "
                    type="level"
                    id="level"
                    onChange={(e)=>{setSkillLevel(e.target.value)}}
                    value={skillLevel}
                    />
                    <button className="add-save-skill">Add Skill</button>
                </form>
        </div>
        // if view is edit
        : 
        <div className="ProfileSkills">
            {/* form here */}
                <form className={classes.form} noValidate onSubmit={handleEditSave}>
                    <h4>{`Editing: ${skillName}, Level: ${skillLevel}`}</h4>
                    <TextField
                    variant="outlined"
                    margin="normal"
                    required
                    fullWidth
                    id="skillname"
                    label="Skill Name: "
                    name="skillname"
                    autoFocus
                    onChange={(e)=>{setSkillName(e.target.value)}}
                    value={skillName}
                    />
                    <TextField
                    variant="outlined"
                    margin="normal"
                    required
                    fullWidth
                    name="level"
                    label="Skill Level: "
                    type="level"
                    id="level"
                    onChange={(e)=>{setSkillLevel(parseInt(e.target.value))}}
                    />
                    <button className="edit-save-skill">Save Edit</button>
                </form>
        </div>
        }
        </>
    );
  }
  
  export default ProfileSkills;
