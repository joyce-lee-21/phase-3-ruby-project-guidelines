import {NavLink} from 'react-router-dom';

function Header() {
    // CREATE STATE FOR THIS:
    let user_auth = true
    return (
        <div className="header">
            
            
            {user_auth === true ?
                <>
                    <div className="header-left">
                        <h2 className="logo">Skilled Match</h2>
                        <div className="nav-menu">
                            <NavLink to="/profile" className="nav-link">
                                Profile
                            </NavLink>
                            <NavLink to="/matches" className="nav-link">
                                Matches
                            </NavLink>
                            <NavLink to="/events" className="nav-link">
                               Events
                            </NavLink>
                        </div>
                    </div>

                    <div className="header-right">
                        <NavLink to="/">
                            <button className="logout">Logout</button>
                        </NavLink>
                    </div>
                </>
                
                : <>
                     <h2 className="logo">Skilled Match</h2>
                     <div className="header-right">
                        <NavLink to="/login">
                            <button className="login">Login</button>
                        </NavLink>
                        <NavLink to="/signup">
                            <button className="signup">Sign Up</button>
                        </NavLink>
                    </div>
                </>
            }
        </div>
    );
}
  
export default Header;