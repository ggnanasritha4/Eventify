import { useState } from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

import "./App.css";


import Navbar from "./components/Navbar";


import Home from "./pages/Home";
import Events from "./pages/Events";
import Register from "./pages/Register";


import AdminLogin from "./pages/AdminLogin";
import AdminDashboard from "./pages/AdminDashboard";
import AdminEvents from "./pages/AdminEvents";
import AdminRegistrations from "./pages/AdminRegistrations";



function App() {


  const [isAdminLoggedIn, setIsAdminLoggedIn] = useState(false);



  return (


    <Router>


      <Navbar />



      <Routes>


        {/* User Pages */}


        <Route

          path="/"

          element={<Home />}

        />



        <Route

          path="/events"

          element={<Events />}

        />



        <Route

          path="/register/:id"

          element={<Register />}

        />





        {/* Admin Pages */}



        <Route

          path="/admin-login"

          element={
            <AdminLogin
              setIsAdminLoggedIn={setIsAdminLoggedIn}
            />
          }

        />




        <Route

          path="/admin-dashboard"

          element={
            <AdminDashboard
              setIsAdminLoggedIn={setIsAdminLoggedIn}
            />
          }

        />




        <Route

          path="/admin/events"

          element={<AdminEvents />}

        />




        <Route

          path="/admin/registrations"

          element={<AdminRegistrations />}

        />



      </Routes>



    </Router>


  );

}


export default App;