import { Link } from "react-router-dom";
import "../styles/Home.css";

function Home() {
  return (
    <div className="home">

      {/* Hero Section */}
      <section className="hero">

        <h1>Eventify</h1>

        <h3>Your Gateway to College Events</h3>

        <p>
          Discover technical, cultural, sports, workshops, seminars,
          hackathons and innovation events through one simple platform.
          Register in just a few clicks and never miss an opportunity.
        </p>

        <Link to="/events">
          <button className="hero-btn">
            Explore Events
          </button>
        </Link>

      </section>

      {/* Features Section */}
      <section className="about">

        <h2>Why Choose Eventify?</h2>

        <div className="features">

          <div className="feature-card">
            <h3>Quick Registration</h3>
            <p>
              Register for your favorite college events quickly with a
              simple and user-friendly process.
            </p>
          </div>

          <div className="feature-card">
            <h3>Wide Range of Events</h3>
            <p>
              Explore technical, cultural, sports, workshops, seminars,
              hackathons and many more exciting events.
            </p>
          </div>

          <div className="feature-card">
            <h3>Easy Event Management</h3>
            <p>
              Administrators can create events, update details and manage
              registrations efficiently.
            </p>
          </div>

          <div className="feature-card">
            <h3>Simple & Secure</h3>
            <p>
              A clean interface with a smooth registration experience for
              both students and administrators.
            </p>
          </div>

        </div>

      </section>

    </div>
  );
}

export default Home;