

function JobSeekersMatchFilter({onSearchChange, onAllMatchingEventBtnClick}) {
    return (
      <div className="filter">
      <input id="search-bar" type="text" placeholder="Search Event" 
             onChange={(e)=>{onSearchChange(e.target.value)}}/>
      <button className="all-event-button" onClick={onAllMatchingEventBtnClick}>All Matching Events</button>
    </div>
    );
  }
  
  export default JobSeekersMatchFilter;