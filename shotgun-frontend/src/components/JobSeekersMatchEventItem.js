function JobSeekersMatchEventItem({matchingEvent}) {
    // console.log(matchingEvent)
    return (
      <div className="job-seekers-match-event-item">
        <li >
            <img src={matchingEvent.image} alt={matchingEvent.name} />
            <h2>{matchingEvent.name}</h2>
            <p>{matchingEvent.event_date}</p>
            <p>{matchingEvent.location}</p>
            <p>{matchingEvent.description}</p>
        </li>
      </div>
    );
  }
  
  export default JobSeekersMatchEventItem;



