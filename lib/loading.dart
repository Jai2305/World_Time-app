import 'package:flutter/material.dart' ;
import 'package:http/http.dart';
import 'dart:developer' as logger ;
import 'dart:convert';
import 'world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time="Loading" ;
  void setupWorldTime() async
  {
    WorldTime instance =WorldTime('Europe/Berlin','Berlin','germany.png') ;
    await instance.getTime() ;  // if the fxn getTime() in world_time.dart is not declared 
    // as Future it will throw an error saying 'await' applied to 'void', which is not a 'Future'
    Navigator.pushReplacementNamed(context,'/home',arguments:{'location':instance.location,'flag':instance.flag,'time':instance.time,'isDay':instance.isDay}) ;
    // so this 3rd argument takes map (i.e key value pair) so via that we can send data to  the targeted page which is determined by the 2nd argument (/home here)
    
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime() ;
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: Colors.blue[900],
      body:Center
      (
        child:SpinKitRotatingCircle
        (
          color: Colors.white,
          size: 80.0,
        ),
      )
      
    );
  }
}