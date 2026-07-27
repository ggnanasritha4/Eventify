import 'package:flutter/material.dart';

import '../models/registration_model.dart';
import '../services/api_service.dart';



class AdminRegistrations extends StatefulWidget {

  const AdminRegistrations({super.key});


  @override
  State<AdminRegistrations> createState() =>
      _AdminRegistrationsState();

}




class _AdminRegistrationsState
    extends State<AdminRegistrations> {


  List<Registration> registrations = [];


  bool loading = true;




  @override
  void initState() {

    super.initState();

    loadRegistrations();

  }





  Future<void> loadRegistrations() async {


    try {


      final data =
      await ApiService.getRegistrations();



      if(!mounted) return;



      setState(() {


        registrations = data;

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

              "Failed to load registrations"

          ),

        ),


      );


    }


  }







  Future<void> deleteRegistration(String id) async {


    try{


      await ApiService.deleteRegistration(id);



      await loadRegistrations();



      if(!mounted) return;



      ScaffoldMessenger.of(context).showSnackBar(


        const SnackBar(

          content:

          Text(

              "Registration deleted successfully"

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

              "Failed to delete registration"

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

            "Admin Registrations"

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



      registrations.isEmpty


          ?

      const Center(

        child:

        Text(

            "No registrations found"

        ),

      )



          :



      ListView.builder(


        itemCount:

        registrations.length,



        itemBuilder:

            (context,index){



          final registration =
          registrations[index];




          return Card(


            margin:

            const EdgeInsets.all(10),



            child:


            ListTile(



              title:

              Text(

                  registration.name

              ),




              subtitle:

              Text(


                "Email: ${registration.email}\n"
                    "Phone: ${registration.phone}\n"
                    "Year: ${registration.year}",


              ),




              trailing:


              IconButton(


                icon:

                const Icon(

                    Icons.delete

                ),



                onPressed: (){


                  deleteRegistration(

                      registration.id!

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