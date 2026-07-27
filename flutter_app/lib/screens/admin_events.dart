import 'package:flutter/material.dart';

import '../models/event_model.dart';
import '../services/api_service.dart';
import '../utils/date_formatter.dart';



class AdminEvents extends StatefulWidget {

  const AdminEvents({super.key});


  @override
  State<AdminEvents> createState() =>
      _AdminEventsState();

}





class _AdminEventsState extends State<AdminEvents> {


  List<Event> events = [];


  final titleController =
  TextEditingController();


  final descriptionController =
  TextEditingController();


  final dateController =
  TextEditingController();


  final locationController =
  TextEditingController();


  final capacityController =
  TextEditingController();



  String? editId;






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

      });



    }

    catch(e){


      if(!mounted) return;



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








  Future<void> selectDate() async {


    DateTime? pickedDate =
    await showDatePicker(


      context: context,


      initialDate:
      DateTime.now(),


      firstDate:
      DateTime(2025),


      lastDate:
      DateTime(2035),


    );




    if(pickedDate != null){


      setState(() {


        dateController.text =


            "${pickedDate.year}-"
            "${pickedDate.month.toString().padLeft(2,'0')}-"
            "${pickedDate.day.toString().padLeft(2,'0')}";


      });


    }


  }








  void clearFields(){


    titleController.clear();


    descriptionController.clear();


    dateController.clear();


    locationController.clear();


    capacityController.clear();



    setState(() {


      editId = null;


    });


  }








  Future<void> saveEvent() async {


    try {



      final event = Event(



        title:

        titleController.text,



        description:

        descriptionController.text,



        date:

        dateController.text,



        location:

        locationController.text,



        capacity:

        int.tryParse(
            capacityController.text
        ) ?? 0,



      );





      bool updating =
      editId != null;






      if(updating){



        await ApiService.updateEvent(


          editId!,


          event,


        );



      }


      else{



        await ApiService.addEvent(


          event,


        );



      }






      clearFields();



      await loadEvents();





      if(!mounted) return;




      ScaffoldMessenger.of(context).showSnackBar(


        SnackBar(

          content:

          Text(


              updating

                  ?

              "Event updated successfully"

                  :

              "Event added successfully"



          ),

        ),


      );




    }



    catch(e){



      if(!mounted) return;




      ScaffoldMessenger.of(context).showSnackBar(


        const SnackBar(

          content:

          Text(
              "Failed to save event"
          ),

        ),


      );



    }


  }









  void editEvent(Event event){



    setState(() {



      editId =
          event.id;



      titleController.text =
          event.title;



      descriptionController.text =
          event.description;



      dateController.text =
          event.date.substring(0,10);



      locationController.text =
          event.location;



      capacityController.text =
          event.capacity.toString();



    });



  }









  Future<void> deleteEvent(String id) async {



    try {



      await ApiService.deleteEvent(id);




      await loadEvents();




      if(!mounted) return;




      ScaffoldMessenger.of(context).showSnackBar(


        const SnackBar(

          content:

          Text(
              "Event deleted successfully"
          ),

        ),


      );



    }


    catch(e){



      if(!mounted) return;



      ScaffoldMessenger.of(context).showSnackBar(


        const SnackBar(

          content:

          Text(
              "Failed to delete event"
          ),

        ),


      );


    }


  }









  Widget inputField(

      String label,

      TextEditingController controller

      ){



    return Padding(


      padding:

      const EdgeInsets.all(8),



      child:


      TextField(


        controller:

        controller,



        decoration:

        InputDecoration(


          labelText:

          label,



          border:

          const OutlineInputBorder(),



        ),



      ),


    );



  }









  Widget dateField(){



    return Padding(


      padding:

      const EdgeInsets.all(8),



      child:


      TextField(


        controller:

        dateController,



        readOnly:

        true,



        decoration:


        InputDecoration(


          labelText:

          "Date",



          border:

          const OutlineInputBorder(),



          suffixIcon:


          IconButton(


            icon:

            const Icon(

                Icons.calendar_month

            ),



            onPressed:

            selectDate,


          ),



        ),



      ),


    );



  }









  @override
  Widget build(BuildContext context) {



    return Scaffold(



      appBar:

      AppBar(


        title:

        const Text(

            "Admin Events"

        ),


      ),





      body:


      SingleChildScrollView(


        child:


        Column(


          children: [



            inputField(

                "Title",

                titleController

            ),




            inputField(

                "Description",

                descriptionController

            ),




            dateField(),




            inputField(

                "Location",

                locationController

            ),




            inputField(

                "Capacity",

                capacityController

            ),






            ElevatedButton(



              onPressed:

              saveEvent,



              child:

              Text(


                  editId == null

                      ?

                  "Add Event"

                      :

                  "Update Event"



              ),



            ),






            const SizedBox(height:20),






            const Text(


              "Event List",



              style:


              TextStyle(


                fontSize:

                20,



                fontWeight:

                FontWeight.bold,



              ),



            ),







            ListView.builder(



              shrinkWrap:

              true,



              physics:

              const NeverScrollableScrollPhysics(),



              itemCount:

              events.length,



              itemBuilder:


                  (context,index){



                final event =
                events[index];



                return Card(



                  margin:

                  const EdgeInsets.all(8),




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


                    Row(


                      mainAxisSize:

                      MainAxisSize.min,



                      children: [



                        IconButton(


                          icon:

                          const Icon(

                              Icons.edit

                          ),



                          onPressed: (){


                            editEvent(event);


                          },



                        ),





                        IconButton(



                          icon:

                          const Icon(

                              Icons.delete

                          ),




                          onPressed: (){



                            if(event.id != null){



                              deleteEvent(

                                  event.id!

                              );



                            }



                          },



                        ),



                      ],



                    ),



                  ),



                );



              },


            )



          ],


        ),


      ),


    );



  }



}