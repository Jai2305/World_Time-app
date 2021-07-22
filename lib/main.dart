import 'package:flutter/material.dart';
import 'home.dart';
import 'choose_location.dart' ;
import 'loading.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/',  // this will be the first page user is gonna see
    routes:{
      '/':(context)=> Loading(),
      '/home':(context)=> Home(),
      '/location':(context)=> ChooseLocation()
    }
  ));
}
