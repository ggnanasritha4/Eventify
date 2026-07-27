import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

import api from "../services/api";
import "../styles/AdminEvents.css";


function AdminEvents() {


  const navigate = useNavigate();


  const [events, setEvents] = useState([]);


  const [eventData, setEventData] = useState({

    title: "",
    description: "",
    date: "",
    location: "",
    capacity: "",

  });



  const [editId, setEditId] = useState(null);



  useEffect(() => {

    fetchEvents();

  }, []);




  const fetchEvents = async () => {

    try {

      const response = await api.get("/events");

      setEvents(response.data);

    } 
    catch (error) {

      console.log(error);

    }

  };




  const handleChange = (e) => {

    setEventData({

      ...eventData,

      [e.target.name]: e.target.value,

    });

  };




  const handleSubmit = async (e) => {

    e.preventDefault();


    try {


      if (editId) {


        await api.put(`/events/${editId}`, eventData);

        alert("Event updated successfully");


      } 
      else {


        await api.post("/events", eventData);

        alert("Event added successfully");


      }



      setEventData({

        title: "",
        description: "",
        date: "",
        location: "",
        capacity: "",

      });



      setEditId(null);


      fetchEvents();



    } 
    catch (error) {


      console.log(error);

      alert("Something went wrong");


    }

  };





  const deleteEvent = async (id) => {


    if (!window.confirm("Are you sure you want to delete this event?")) {

      return;

    }



    try {


      await api.delete(`/events/${id}`);


      alert("Event deleted successfully");


      fetchEvents();



    } 
    catch(error) {


      console.log(error);


    }


  };






  const editEvent = (event) => {


    setEventData({

      title: event.title,

      description: event.description,

      date: event.date.substring(0,10),

      location: event.location,

      capacity: event.capacity,

    });



    setEditId(event._id);



    window.scrollTo({

      top:0,

      behavior:"smooth"

    });


  };






  return (


    <div className="admin-container">


      <h1 className="admin-title">
        Manage Events
      </h1>



      



      <button

        className="back-btn"

        onClick={() => navigate("/admin-dashboard")}

      >

        ← Back to Dashboard

      </button>





      <form 
        className="admin-form"
        onSubmit={handleSubmit}
      >



        <input

          type="text"

          name="title"

          placeholder="Event Title"

          value={eventData.title}

          onChange={handleChange}

          required

        />



        <textarea

          name="description"

          placeholder="Event Description"

          value={eventData.description}

          onChange={handleChange}

          required

        />



        <input

          type="date"

          name="date"

          value={eventData.date}

          onChange={handleChange}

          required

        />



        <input

          type="text"

          name="location"

          placeholder="Location"

          value={eventData.location}

          onChange={handleChange}

          required

        />



        <input

          type="number"

          name="capacity"

          placeholder="Capacity"

          value={eventData.capacity}

          onChange={handleChange}

          required

        />




        <button type="submit">

          {editId ? "Update Event" : "Add Event"}

        </button>



      </form>






      <h2 className="events-heading">

        Existing Events

      </h2>






      <div className="event-list">



        {

          events.map((event)=>(



            <div 
              className="event-card"
              key={event._id}
            >



              <h3>
                {event.title}
              </h3>



              <p>
                {event.description}
              </p>



              <p>
                📅 {new Date(event.date)
                .toLocaleDateString("en-GB")
                .replace(/\//g,"-")}
              </p>



              <p>
                📍 {event.location}
              </p>



              <p>
                👥 Capacity: {event.capacity}
              </p>





              <div className="action-buttons">



                <button

                  className="edit-btn"

                  onClick={() => editEvent(event)}

                >

                  Edit

                </button>




                <button

                  className="delete-btn"

                  onClick={() => deleteEvent(event._id)}

                >

                  Delete

                </button>



              </div>



            </div>



          ))

        }



      </div>



    </div>


  );


}



export default AdminEvents;