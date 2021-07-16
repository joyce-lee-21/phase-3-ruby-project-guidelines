import EventsList from './EventsList';
import React, { useState } from "react";
import TextField from '@material-ui/core/TextField';
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

function EventsContainer( {userStatus, currentUser} ) {

    const [userEvents, setUserEvents] = useState(currentUser.events)
    const [eventView, setEventView] = useState("view") //"view", "edit", "add"
    const [eventId, setEventId] = useState(0)
    const [eventName, setEventName] = useState("")
    const [eventDate, setEventDate] = useState()
    const [eventLocation, setEventLocation] = useState("")
    const [eventDesc, setEventDesc] = useState("")
    

    const classes = useStyles();

    
    // when a user clicks on edit - DONE!!
    const handleEventEdit = (id, name, date, location, desc) => {
        // console.log(id, name, date, location, desc)
        setEventView("edit")
        setEventId(id)
        setEventName(name)
        setEventDate(date)
        setEventDesc(desc)
        setEventLocation(location)
    }
    // when a user clicks on save edit - DONE!!
    const handleEditSave = (e) => {
        e.preventDefault()
        let updated_event = {
            id: eventId,
            name: eventName,
            event_date: eventDate,
            location: eventLocation,
            description: eventDesc
        }
        fetch("http://localhost:9393/events", {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(updated_event)
        })
        .then(res => res.json())
        .then(data =>
            {let event_updated = data.patch_event;
            setUserEvents(userEvents.map(event => {
                if (event.id === event_updated.id) {
                    return {
                        id: event_updated.id,
                        name: event_updated.name,
                        event_date: event_updated.event_date, 
                        location: event_updated.location,
                        description: event_updated.description
                    }
                } else {
                    return event
                }
            }))}
        )
        setEventView("view")
    }
    // when a user clicks on add - DONE!!
    const handleEventAdd = () => {
        setEventView("add")
    }
    // when a user clicks on save add - DONE!!
    const handleAddSave = (e) => {
        e.preventDefault()
        
        // need to convert eventDate to DateTime in ruby/db
        let new_event = {
            recruiter_id: currentUser.id,
            name: eventName,
            event_date: eventDate, 
            location: eventLocation,
            description: eventDesc
        }

        fetch("http://localhost:9393/events", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(new_event)
        })
        .then(data => console.log(data))

        setUserEvents([...userEvents, new_event])
        setEventView("view")
    }

    // when a user clicks on delete - DONE!!
    const handleEventDelete = (event_id) => {
        fetch("http://localhost:9393/events", {
            method: "DELETE",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                id: event_id
            })
        })
        setUserEvents(userEvents.filter(event => event.id !== event_id))
    }

    return (
      <div className="events-container">
        <div className="greeting-box">
            <h2>{`Hello, ${currentUser.name}`}</h2>
        </div>
        <div className="events-content">
        {/* Event List starts */}
            
            <>
        {/* if view is view */}
        {eventView === "view"
        ? <div className="event-list">
            <h2>Event List</h2>
            {userEvents.map((event) =>
            // {const timestamp = event.event_date; 

            // console.log(new Intl.DateTimeFormat('en-US', {year: 'numeric', month: '2-digit',day: '2-digit', hour: '2-digit', minute: '2-digit'}).format(timestamp));
                (<div className="event-item-container">
                    <span className="event-item-details">
                        <h4>Name:</h4>
                        <p>{event.name}</p>
                    </span>
                    <span className="event-item-details">
                        <h4>Location:</h4>
                        <p>{event.location}</p>
                    </span>
                    <span className="event-item-details">
                        <h4>Date:</h4>
                        <p>{event.event_date}</p>
                    </span>
                    <span className="event-item-details">
                        <h4>Description:</h4>
                        {/* {console.log(event.description)} */}
                        <p>{event.description}</p>
                    </span>
                    <span className="event-buttons">
                        <button className="edit-event" onClick={() => handleEventEdit(event.id, event.name, event.event_date, event.location, event.description)}>Edit</button>
                        <button className="remove-event" onClick={() => handleEventDelete(event.id)}>Remove</button>
                    </span>
                </div>)
            // }
            )}
            <button className="add-event" onClick={() => handleEventAdd()}>Add New Event</button>
        </div>
        : eventView === "add"
        // if view is add
            ? <div className="event-add-form">
                {/* form here */}
                    <form className={classes.form} noValidate onSubmit={handleAddSave}>
                        <TextField
                        variant="outlined"
                        margin="normal"
                        required
                        fullWidth
                        id="name"
                        label="Event Name: "
                        name="name"
                        autoFocus
                        onChange={(e)=>{setEventName(e.target.value)}}
                        />
                        <TextField
                        variant="outlined"
                        margin="normal"
                        required
                        fullWidth
                        name="Date"
                        label="Event Date (MM-DD-YYYY HH:MM)"
                        id="date"
                        onChange={(e)=>{setEventDate(e.target.value)}}
                        />
                        <TextField
                        variant="outlined"
                        margin="normal"
                        required
                        fullWidth
                        name="Location"
                        label="Event Location: "
                        id="location"
                        onChange={(e)=>{setEventLocation(e.target.value)}}
                        />
                        <TextField
                        variant="outlined"
                        margin="normal"
                        required
                        fullWidth
                        name="desc"
                        label="Event Description: "
                        id="desc"
                        onChange={(e)=>{setEventDesc(e.target.value)}}
                        />
                        <button className="add-save-skill">Add Event</button>
                    </form>
            </div>
            // if view is edit
            : <div className="event-edit">
                {/* form here */}
                <form className={classes.form} noValidate onSubmit={handleEditSave}>
                    <h4>{`Editing: ${eventName}`}</h4>
                    <TextField
                    variant="outlined"
                    margin="normal"
                    required
                    fullWidth
                    id="name"
                    label="Event Name"
                    name="name"
                    autoFocus
                    onChange={(e)=>{setEventName(e.target.value)}}
                    value={eventName}
                    />
                    <TextField
                    variant="outlined"
                    margin="normal"
                    required
                    fullWidth
                    id="date"
                    label="Event Date"
                    name="date"
                    autoFocus
                    onChange={(e)=>{setEventDate(e.target.value)}}
                    value={eventDate}
                    />
                    <TextField
                    variant="outlined"
                    margin="normal"
                    required
                    fullWidth
                    id="location"
                    label="Event Location"
                    name="location"
                    autoFocus
                    onChange={(e)=>{setEventLocation(e.target.value)}}
                    value={eventLocation}
                    />
                    <TextField
                    variant="outlined"
                    margin="normal"
                    required
                    fullWidth
                    id="desc"
                    label="Event Description"
                    name="desc"
                    autoFocus
                    onChange={(e)=>{setEventDesc(e.target.value)}}
                    value={eventDesc}
                    />
                    <button className="edit-save-skill">Save Edit</button>
                </form>
            </div>
        }
        </>
        </div>
      </div>
    );
  }

  export default EventsContainer;