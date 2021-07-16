

function JobSeekersMatchFilter({onSearchChange}) {
    return (
      <div className="filter">
      <input id="search-bar" type="text" placeholder="Search Event" 
             onChange={(e)=>{onSearchChange(e.target.value)}}/>
    </div>
    );
  }
  
  export default JobSeekersMatchFilter;