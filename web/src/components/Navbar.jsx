import { NavLink } from "react-router-dom";
import "../styles/Navbar.css";

function Navbar() {
  return (
    <nav className="navbar">
      <div className="logo">
        <h2>Eventify</h2>
      </div>

      <ul className="nav-links">
        <li>
          <NavLink
            to="/"
            className={({ isActive }) => (isActive ? "active" : "")}
          >
            Home
          </NavLink>
        </li>

        <li>
          <NavLink
            to="/events"
            className={({ isActive }) => (isActive ? "active" : "")}
          >
            Events
          </NavLink>
        </li>

        <li>
          <NavLink
            to="/admin-login"
            className={({ isActive }) => (isActive ? "active" : "")}
          >
            Admin
          </NavLink>
        </li>
      </ul>
    </nav>
  );
}

export default Navbar;