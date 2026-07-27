import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import api from "../services/api";
import "../styles/Register.css";


function Register() {

  const { id } = useParams();


  const [event, setEvent] = useState(null);


  const [form, setForm] = useState({

    name: "",

    email: "",

    phone: "",

    branch: "",

    year: "",

    eventId: id,

  });



  useEffect(() => {

    loadEvent();

  }, []);



  const loadEvent = async () => {

    try {

      const res = await api.get(`/events/${id}`);

      setEvent(res.data);


    } catch (error) {

      console.log(error);

    }

  };





  const handleChange = (e) => {


    setForm({

      ...form,

      [e.target.name]: e.target.value,

    });


  };







  const handleSubmit = async (e) => {


    e.preventDefault();



    if (

      !form.name ||

      !form.email ||

      !form.phone ||

      !form.branch ||

      !form.year

    ) {


      alert("Please fill all required fields.");

      return;


    }




    try {


      await api.post(

        "/registrations",

        form

      );



      alert("Registration Successful!");



      setForm({

        name: "",

        email: "",

        phone: "",

        branch: "",

        year: "",

        eventId: id,

      });



    }

    catch(error){


      console.log(error.response?.data || error);


      alert("Registration Failed");


    }


  };







  return (


    <div className="register-container">


      <form

        className="register-card"

        onSubmit={handleSubmit}

      >



        <h2>

          Event Registration

        </h2>





        {event && (

          <div className="selected-event">


            <h3>

              {event.title}

            </h3>


            <p>

              📅 {new Date(event.date).toLocaleDateString("en-GB")}

            </p>


            <p>

              📍 {event.location}

            </p>


          </div>

        )}






        <label>

          Full Name *

        </label>


        <input

          type="text"

          name="name"

          placeholder="Enter your full name"

          value={form.name}

          onChange={handleChange}

        />






        <label>

          Email Address *

        </label>


        <input

          type="email"

          name="email"

          placeholder="Enter your email"

          value={form.email}

          onChange={handleChange}

        />






        <label>

          Phone Number *

        </label>


        <input

          type="text"

          name="phone"

          placeholder="Enter your phone number"

          value={form.phone}

          onChange={handleChange}

        />







        <label>

          Branch *

        </label>


        <input

          type="text"

          name="branch"

          placeholder="Enter your branch"

          value={form.branch}

          onChange={handleChange}

        />








        <label>

          Year of Study *

        </label>


        <select

          name="year"

          value={form.year}

          onChange={handleChange}

        >


          <option value="">

            Select Year

          </option>


          <option>

            1st Year

          </option>


          <option>

            2nd Year

          </option>


          <option>

            3rd Year

          </option>


          <option>

            4th Year

          </option>


        </select>







        <button type="submit">

          Register Now

        </button>




      </form>


    </div>


  );

}


export default Register;