import 'package:flutter/material.dart' ;
import 'package:http/http.dart';
import 'dart:developer' as logger ;
import 'dart:convert';
import 'package:intl/intl.dart' ;

class WorldTime
{
  String url ;
  String location ;
  String time;
  String flag ;
  bool isDay;
  WorldTime(this.url,this.location,this.flag) ;

  Future <void> getTime() async
  {
    try
    {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url')) ; 
      //For 'Error: The argument type 'String' can't be assigned to the parameter type 'Uri' ' error,  in the getData() function, change 
      // get('htttp...') to get(Uri.parse('http...')
      Map data=jsonDecode(response.body) ;
      //get properties from data
      String datetime=data['datetime'] ;
      String offset =data['utc_offset'].substring(1,3) ; //.substrig is a method for trimming the string
      //makeing adate time object 
      DateTime now =DateTime.parse(datetime) ;

      now=now.add(Duration(hours:int.parse(offset))) ;
      isDay= now.hour>6 && now.hour<18 ? true : false ;
      time=DateFormat.jm().format(now) ;  // a fxn from intlpackage which converts the data 'now'into a readable format
    }  
    catch(e)
    {
      time=e ;
    }
  }
}