class Event {

  final String? id;

  final String title;

  final String description;

  final String date;

  final String location;

  final int capacity;



  Event({

    this.id,

    required this.title,

    required this.description,

    required this.date,

    required this.location,

    required this.capacity,

  });



  factory Event.fromJson(Map<String, dynamic> json) {


    return Event(

      id: json["_id"],

      title: json["title"] ?? "",

      description: json["description"] ?? "",

      date: json["date"] ?? "",

      location: json["location"] ?? "",

      capacity: json["capacity"] ?? 0,

    );


  }





  Map<String, dynamic> toJson() {


    return {

      "title": title,

      "description": description,

      "date": date,

      "location": location,

      "capacity": capacity,

    };


  }


}