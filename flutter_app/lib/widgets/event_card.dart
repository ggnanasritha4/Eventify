import 'package:flutter/material.dart';

import '../models/event_model.dart';
import '../utils/date_formatter.dart';



class EventCard extends StatelessWidget {


  final Event event;

  final VoidCallback onRegister;



  const EventCard({

    super.key,

    required this.event,

    required this.onRegister,

  });




  @override
  Widget build(BuildContext context) {


    return Card(


      margin:
      const EdgeInsets.all(10),



      elevation:3,



      child:

      Padding(


        padding:
        const EdgeInsets.all(12),



        child:

        Column(


          crossAxisAlignment:
          CrossAxisAlignment.start,



          children:[



            Text(

              event.title,

              style:
              const TextStyle(

                fontSize:20,

                fontWeight:
                FontWeight.bold,

              ),

            ),




            const SizedBox(height:8),




            Text(

              event.description,

            ),




            const SizedBox(height:8),




            Text(

              "Date: ${formatEventDate(event.date)}",

            ),




            Text(

              "Location: ${event.location}",

            ),




            Text(

              "Capacity: ${event.capacity}",

            ),




            const SizedBox(height:10),




            ElevatedButton(


              onPressed:
              onRegister,


              child:

              const Text(
                "Register",
              ),


            ),



          ],


        ),

      ),


    );


  }

}