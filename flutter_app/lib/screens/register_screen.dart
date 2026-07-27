import 'package:flutter/material.dart';

import '../models/registration_model.dart';
import '../services/api_service.dart';



class RegisterScreen extends StatefulWidget {


  final String eventId;


  const RegisterScreen({

    super.key,

    required this.eventId,

  });



  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();

}






class _RegisterScreenState extends State<RegisterScreen> {



  final nameController =
  TextEditingController();


  final emailController =
  TextEditingController();


  final phoneController =
  TextEditingController();


  final yearController =
  TextEditingController();


  final branchController =
  TextEditingController();




  bool loading = false;






  Future<void> register() async {



    if(

    nameController.text.isEmpty ||

        emailController.text.isEmpty ||

        phoneController.text.isEmpty ||

        yearController.text.isEmpty ||

        branchController.text.isEmpty

    ){


      ScaffoldMessenger.of(context).showSnackBar(


        const SnackBar(

          content:

          Text(
              "Please fill all required fields"
          ),

        ),


      );


      return;


    }






    try {



      setState(() {

        loading = true;

      });






      final registration = Registration(



        eventId:

        widget.eventId,



        name:

        nameController.text,



        email:

        emailController.text,



        phone:

        phoneController.text,



        year:

        yearController.text,



        branch:

        branchController.text,



      );






      await ApiService.registerUser(

          registration

      );






      if(!mounted) return;





      ScaffoldMessenger.of(context).showSnackBar(


        const SnackBar(

          content:

          Text(
              "Registration successful"
          ),

        ),


      );





      Navigator.pop(context);



    }



    catch(e){



      if(!mounted) return;




      ScaffoldMessenger.of(context).showSnackBar(


        const SnackBar(

          content:

          Text(
              "Registration failed"
          ),

        ),


      );



    }





    finally{



      if(mounted){


        setState(() {


          loading = false;


        });


      }


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









  @override
  Widget build(BuildContext context) {


    return Scaffold(



      appBar:

      AppBar(


        title:

        const Text(

            "Register"

        ),


      ),





      body:


      SingleChildScrollView(



        child:


        Padding(



          padding:

          const EdgeInsets.all(16),




          child:


          Column(



            children: [




              inputField(

                  "Name *",

                  nameController

              ),





              inputField(

                  "Email *",

                  emailController

              ),





              inputField(

                  "Phone *",

                  phoneController

              ),





              inputField(

                  "Year *",

                  yearController

              ),





              inputField(

                  "Branch *",

                  branchController

              ),






              const SizedBox(height:20),






              ElevatedButton(



                onPressed:

                loading

                    ? null

                    : register,




                child:



                loading



                    ?

                const SizedBox(


                  height:20,

                  width:20,


                  child:


                  CircularProgressIndicator(),


                )



                    :



                const Text(

                    "Register Now"

                ),



              )



            ],


          ),


        ),


      ),


    );


  }



}