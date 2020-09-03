import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String time;  //output time
  String flag;  //url to the image of the flag
  String url;  //url to the root api
  String location;  //location for UI
  bool isDay;
  
  WorldTime({this.flag, this.location,this.url}); //making constructors for the class
  
  Future<void> getTime() async{


    Response res=await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(res.body);
    //print(data);
    String t=data['datetime'];
    //print(t);
    String offset= data['utc_offset'];
    //print(offset);

    String offsetH=offset.substring(1,3);
    String offsetM=offset.substring(4,6);
    String sign=offset[0];
    //print(sign);
    //print(offsetH);
    //print(offsetM);

    DateTime now=DateTime.parse(t);
    if(sign=='+')
      now=now.add(Duration(hours: int.parse(offsetH),minutes: int.parse(offsetM)));
    else
      now=now.subtract(Duration(hours: int.parse(offsetH),minutes: int.parse(offsetM)));
    isDay=(now.hour>6 && now.hour<20)? true : false;

    time=DateFormat.jm().format(now);
  }
}