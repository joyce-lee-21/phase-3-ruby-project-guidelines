import {NavLink} from 'react-router-dom';

function Header( {currentUser, setCurrentUser} ) {

    const handleClick = () => {
        setCurrentUser(null)
    }

    return (
        <div className="header">
            
            {currentUser !== null ?
                <>
                    <div className="header-left">
                        <NavLink exact to="/" className="nav-link" style={{ textDecoration: 'none' }}>
                            <h2 className="logo">Skilled Match</h2>
                        </NavLink>
                        <div className="nav-menu">
                            <NavLink to="/profile" className="nav-link" style={{ textDecoration: 'none' }}>
                                <button className="profile" >Profile</button>
                            </NavLink>
                            <NavLink to="/matches" className="nav-link" style={{ textDecoration: 'none' }}>
                                <button className="matches">Matches</button>
                            </NavLink>
                            <NavLink to="/events" className="nav-link" style={{ textDecoration: 'none' }}>
                                <button className="events">Events</button>
                            </NavLink>
                        </div>
                    </div>

                    <div className="header-right">
                        <NavLink exact to="/" style={{ textDecoration: 'none' }}>
                            <button className="logout" onClick={handleLogout}>Logout</button>
                        </NavLink>
                    </div>
                </>
                
                : <>
                     <h2 className="logo">Skilled Match</h2>
                     <div className="header-right">
                        <NavLink to="/login" style={{ textDecoration: 'none' }}>
                            <button className="login">Login</button>
                        </NavLink>
                        <NavLink to="/signup" style={{ textDecoration: 'none' }}>
                            <button className="signup">Sign Up</button>
                        </NavLink>
                    </div>
                </>
            }
        </div>
    );
}
  
export default Header;