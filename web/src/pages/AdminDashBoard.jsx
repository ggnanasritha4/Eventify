import { useNavigate } from "react-router-dom";

import "../styles/AdminDashboard.css";


function AdminDashboard({ setIsAdminLoggedIn }) {


  const navigate = useNavigate();




  const handleLogout = () => {


    setIsAdminLoggedIn(false);


    alert("Logged out successfully");


    navigate("/admin-login");


  };





  return (



    <div className="admin-dashboard-container">



      <div className="admin-dashboard-card">





        <h1>
          Admin Dashboard
        </h1>





        <p>
          Welcome Admin! Manage events and registrations from here.
        </p>






        <div className="admin-buttons">





          <button

            onClick={() => navigate("/admin/events")}

          >

            Manage Events

          </button>







          <button

            onClick={() => navigate("/admin/registrations")}

          >

            View Registrations

          </button>







          <button

            className="logout-btn"

            onClick={handleLogout}

          >

            Logout

          </button>





        </div>






      </div>






    </div>




  );



}



export default AdminDashboard;