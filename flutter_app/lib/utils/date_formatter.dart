String formatEventDate(String date) {

  try {

    DateTime parsedDate =
    DateTime.parse(date);


    return
        "${parsedDate.day}-${parsedDate.month}-${parsedDate.year}";


  } catch(e) {

    return date;

  }

}