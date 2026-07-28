import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

import api from "../services/api";

import "../styles/AdminRegistrations.css";


function AdminRegistrations() {


  const navigate = useNavigate();



  const [registrations,setRegistrations] = useState([]);




  useEffect(()=>{

    fetchRegistrations();

  },[]);





  const fetchRegistrations = async()=>{


    try{


      const response = await api.get("/registrations");


      setRegistrations(response.data);



    }
    catch(error){


      console.log(error);


    }


  };






  return (



    <div className="registrations-container">



      <h2 className="registrations-title">

        Registered Participants

      </h2>




      <button

        className="back-btn"

        onClick={() => navigate("/admin-dashboard")}

      >

        ← Back to Dashboard

      </button>






      {

        registrations.length === 0 ? (


          <p className="no-data">

            No registrations available.

          </p>


        ) : (



          <table className="registrations-table">



            <thead>


              <tr>

                <th>Name</th>

                <th>Email</th>

                <th>Phone</th>

                <th>Event</th>

                <th>Registered On</th>


              </tr>


            </thead>




            <tbody>



              {

                registrations.map((reg)=>(


                  <tr key={reg._id}>


                    <td>{reg.name}</td>


                    <td>{reg.email}</td>


                    <td>{reg.phone}</td>


                    <td>
                      {reg.eventId?.title || "N/A"}
                    </td>


                    <td>

                      {

                        reg.createdAt

                        ? new Date(reg.registeredAt)
                          .toLocaleDateString("en-GB")

                        : "N/A"

                      }

                    </td>


                  </tr>



                ))


              }



            </tbody>




          </table>


        )


      }




    </div>


  );


}



export default AdminRegistrations;