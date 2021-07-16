function JobSeekersMatchEventItem({matchingEvent}) {
    // console.log(matchingEvent)
    return (
      <div >
        <li className="job-seekers-match-event-item">
            <div className="event-photo-wrapper">
              <img src={matchingEvent.image} alt={matchingEvent.name} className="event-photo"/>
            </div>
            <div className="event-detail-contianer">
              <h2 className="event-name" >{matchingEvent.name}</h2>
              <p>{matchingEvent.event_date}</p>
              <p>{matchingEvent.location}</p>
              <p>{matchingEvent.description}</p>
            </div>
        </li>
      </div>
    );
  }
  
  export default JobSeekersMatchEventItem;



