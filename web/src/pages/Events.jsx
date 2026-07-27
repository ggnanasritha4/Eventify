import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import api from "../services/api";
import "../styles/Events.css";

function Events() {
  const [events, setEvents] = useState([]);

  useEffect(() => {
    fetchEvents();
  }, []);

  const fetchEvents = async () => {
    try {
      const response = await api.get("/events");
      setEvents(response.data);
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <div className="events-container">

      <h1 className="events-title">Upcoming Events</h1>

      

      {events.length === 0 ? (
        <div className="no-events">
          <h3>No Events Available</h3>
          <p>Please check back later.</p>
        </div>
      ) : (
        <div className="events-grid">
          {events.map((event) => (
            <div className="event-card" key={event._id}>

              <h2>{event.title}</h2>

              <p className="description">
                {event.description}
              </p>

              <p>
                 <strong>Date:</strong>{" "}
                {new Date(event.date).toLocaleDateString("en-GB")}
              </p>

              <p>
                 <strong>Location:</strong> {event.location}
              </p>

              <p>
                 <strong>Capacity:</strong> {event.capacity}
              </p>

              <Link to={`/register/${event._id}`}>
                <button className="register-btn">
                  Register Now
                </button>
              </Link>

            </div>
          ))}
        </div>
      )}

    </div>
  );
}

export default Events;