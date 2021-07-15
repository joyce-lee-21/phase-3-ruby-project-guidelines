function JobSeekersSideBarItem({logo, companyName, name, email, location}) {
    // console.log(image, companyName, name, email, location)
    return (
      <div className="job-seekers-side-bar-item">
        <li >
            <img src={logo} alt={companyName} />
            <h2>{companyName}</h2>
            <p>{name}</p>
            <p>{email}</p>
            <p>{location}</p>
        </li>
      </div>
    );
  }
  
  export default JobSeekersSideBarItem;
