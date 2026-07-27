import 'package:flutter/material.dart';

import '../models/event_model.dart';
import '../services/api_service.dart';
import '../utils/date_formatter.dart';
import 'register_screen.dart';



class EventsScreen extends StatefulWidget {

  const EventsScreen({super.key});


  @override
  State<EventsScreen> createState() =>
      _EventsScreenState();

}




class _EventsScreenState extends State<EventsScreen> {


  List<Event> events = [];

  bool loading = true;




  @override
  void initState() {

    super.initState();

    loadEvents();

  }






  Future<void> loadEvents() async {


    try {


      final data =
      await ApiService.getEvents();



      if(!mounted) return;



      setState(() {

        events = data;

        loading = false;

      });



    }


    catch(e){


      if(!mounted) return;



      setState(() {

        loading = false;

      });



      ScaffoldMessenger.of(context).showSnackBar(


        const SnackBar(

          content:

          Text(
              "Failed to load events"
          ),

        ),


      );


    }


  }








  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar:

      AppBar(

        title:

        const Text(

            "Events"

        ),

      ),





      body:


      loading


          ?

      const Center(

        child:

        CircularProgressIndicator(),

      )



          :



      events.isEmpty


          ?

      const Center(

        child:

        Text(

            "No events available"

        ),

      )



          :



      ListView.builder(


        itemCount:

        events.length,



        itemBuilder:

            (context,index){



          final event =
          events[index];



          return Card(


            margin:

            const EdgeInsets.all(10),



            child:


            ListTile(



              title:

              Text(

                  event.title

              ),




              subtitle:

              Text(


                "Description: ${event.description}\n"
                    "Date: ${formatEventDate(event.date)}\n"
                    "Location: ${event.location}\n"
                    "Capacity: ${event.capacity}",



              ),





              trailing:


              ElevatedButton(


                child:

                const Text(

                    "Register"

                ),




                onPressed: (){


                  Navigator.push(


                    context,


                    MaterialPageRoute(


                      builder:

                          (context)=>RegisterScreen(


                        eventId:

                        event.id!,


                      ),


                    ),


                  );


                },


              ),



            ),


          );



        },


      ),



    );


  }


}