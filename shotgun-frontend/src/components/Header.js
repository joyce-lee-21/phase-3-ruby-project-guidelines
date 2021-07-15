import {NavLink} from 'react-router-dom';

function Header() {
    // CREATE STATE FOR THIS:
    let user_auth = false
    return (
        <div className="Header">
            <h2>Skilled Match</h2>
            {user_auth === true
                ? [<NavLink to="/profile">
                        <button className="profile">Profile</button>
                    </NavLink>,
                    <NavLink to="/matches">
                        <button className="matches">Matches</button>
                    </NavLink>,
                    <NavLink to="/events">
                        <button className="events">Events</button>
                    </NavLink>,
                    <NavLink to="/">
                        <button className="logout">Logout</button>
                    </NavLink>
                ]
                : [<NavLink to="/login">
                        <button className="login">Login</button>
                    </NavLink>,
                    <NavLink to="/signup">
                        <button className="signup">Sign Up</button>
                    </NavLink>
                ]
            }
        </div>
    );
}
  
export default Header;