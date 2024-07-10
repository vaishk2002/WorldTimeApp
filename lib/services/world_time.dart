import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{


  String location; //location name
  String time=""; // the time in that location
  String flag; //url to asset icon
  String url;
  bool isDayTime=false;

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getData() async{


  try{
    Response response= await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
  Map data = jsonDecode(response.body);

  // get properties from json
  String datetime = data['datetime'];
  String offset = data['utc_offset'].substring(0,3);

  // create DateTime object
  DateTime now = DateTime.parse(datetime);
  now = now.add(Duration(hours: int.parse(offset)));

  // set the time property
  isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
  time = DateFormat.jm().format(now);
  }
  catch (e) {
  print(e);
  time = 'could not get time';
  }





  }


}
