import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/event_model.dart';
import '../models/registration_model.dart';


class ApiService {

  static const String baseUrl = "http://localhost:5000/api";


  // ================= EVENTS =================


  static Future<List<Event>> getEvents() async {

    final response =
        await http.get(Uri.parse("$baseUrl/events"));

    if (response.statusCode == 200) {

      List data = jsonDecode(response.body);

      return data.map((e) => Event.fromJson(e)).toList();

    } else {

      throw Exception("Failed to load events");

    }
  }



  static Future<void> addEvent(Event event) async {

    final response = await http.post(
      Uri.parse("$baseUrl/events"),
      headers: {
        "Content-Type": "application/json"
      },
      body: jsonEncode(event.toJson()),
    );


    if(response.statusCode != 201){

      throw Exception("Failed to add event");

    }
  }




  static Future<void> updateEvent(
      String id,
      Event event
      ) async {


    final response = await http.put(

      Uri.parse("$baseUrl/events/$id"),

      headers: {
        "Content-Type": "application/json"
      },

      body: jsonEncode(event.toJson()),

    );


    if(response.statusCode != 200){

      throw Exception("Failed to update event");

    }

  }




  static Future<void> deleteEvent(String id) async {


    final response = await http.delete(

      Uri.parse("$baseUrl/events/$id"),

    );


    if(response.statusCode != 200){

      throw Exception("Failed to delete event");

    }

  }





  // ================= REGISTRATIONS =================



  static Future<void> registerUser(
      Registration registration
      ) async {


    final response = await http.post(

      Uri.parse("$baseUrl/registrations"),

      headers: {

        "Content-Type": "application/json"

      },


      body: jsonEncode(

        registration.toJson()

      ),

    );


    if(response.statusCode != 201){

      throw Exception("Registration failed");

    }

  }





  static Future<List<Registration>> getRegistrations() async {


    final response = await http.get(

      Uri.parse("$baseUrl/registrations")

    );


    if(response.statusCode == 200){


      List data = jsonDecode(response.body);


      return data
          .map((e)=>Registration.fromJson(e))
          .toList();


    }else{


      throw Exception("Failed to load registrations");


    }

  }





  static Future<void> deleteRegistration(
      String id
      ) async {


    final response = await http.delete(

      Uri.parse("$baseUrl/registrations/$id")

    );


    if(response.statusCode != 200){


      throw Exception("Failed to delete registration");


    }

  }


}