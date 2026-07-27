import { useState } from "react";
import { useNavigate } from "react-router-dom";

import "../styles/AdminLogin.css";


function AdminLogin({ setIsAdminLoggedIn }) {


  const navigate = useNavigate();



  const [form, setForm] = useState({

    email: "",
    password: ""

  });



  const handleChange = (e) => {

    setForm({

      ...form,

      [e.target.name]: e.target.value

    });

  };



  const handleSubmit = (e) => {

    e.preventDefault();



    if (!form.email || !form.password) {

      alert("Please enter email and password");

      return;

    }



    // Demo Admin Credentials

    if (
      form.email === "admin@gmail.com" &&
      form.password === "admin123"
    ) {


      if (setIsAdminLoggedIn) {

        setIsAdminLoggedIn(true);

      }


      alert("Admin Login Successful");


      navigate("/admin-dashboard");


    } 
    else {


      alert("Invalid Admin Credentials");


    }


  };



  return (

    <div className="admin-login-container">


      <form
        className="admin-login-card"
        onSubmit={handleSubmit}
      >


        <h2>
          Admin Login
        </h2>



        <label>
          Email *
        </label>


        <input

          type="email"

          name="email"

          placeholder="Enter admin email"

          value={form.email}

          onChange={handleChange}

          required

        />



        <label>
          Password *
        </label>


        <input

          type="password"

          name="password"

          placeholder="Enter password"

          value={form.password}

          onChange={handleChange}

          required

        />



        <button type="submit">

          Login

        </button>



      </form>


    </div>

  );

}


export default AdminLogin;