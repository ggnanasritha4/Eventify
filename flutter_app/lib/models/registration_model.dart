class Registration {


  String? id;

  String eventId;

  String name;

  String email;

  String phone;

  String branch;

  String year;



  Registration({

    this.id,

    required this.eventId,

    required this.name,

    required this.email,

    required this.phone,

    required this.branch,

    required this.year,

  });






  factory Registration.fromJson(Map<String, dynamic> json) {


    return Registration(


      id: json['_id']?.toString(),



      eventId:

      json['eventId'] is String

          ?

      json['eventId']

          :

      json['eventId'] != null

          ?

      json['eventId']['_id'].toString()

          :

      "",




      name:

      json['name']?.toString() ?? "",



      email:

      json['email']?.toString() ?? "",



      phone:

      json['phone']?.toString() ?? "",



      branch:

      json['branch']?.toString() ?? "",



      year:

      json['year']?.toString() ?? "",



    );


  }








  Map<String, dynamic> toJson() {


    return {


      "eventId":

      eventId,


      "name":

      name,


      "email":

      email,


      "phone":

      phone,


      "branch":

      branch,


      "year":

      year,


    };


  }



}