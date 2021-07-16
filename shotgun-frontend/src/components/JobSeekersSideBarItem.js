function JobSeekersSideBarItem({matchingRecruiter, onSideBarItemClick}) {
    const handleSideBarItemClick = () => {
      onSideBarItemClick(matchingRecruiter)
    }



    return (
      <div className="job-seekers-side-bar-item">
        <li onClick={handleSideBarItemClick}>
            <img src={matchingRecruiter.logo} alt={matchingRecruiter.company_name} />
            <h2>{matchingRecruiter.companyName}</h2>
            <p>{matchingRecruiter.name}</p>
            <p>{matchingRecruiter.email}</p>
            <p>{matchingRecruiter.location}</p>
        </li>
      </div>
    );
  }
  
  export default JobSeekersSideBarItem;
