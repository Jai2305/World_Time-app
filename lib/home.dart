import 'package:flutter/material.dart';
import 'dart:developer' as logger ;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};
  String image ;
  // we can not assign the data variable the arguments that has been passed from loading on this line
  // bcoz it throws some wierd errors 
  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments:data ;
    logger.log("building ur app");
    image = data['isDay'] ? "assets/day.png" :"assets/night.png" ;
    return Scaffold
    (
      body:Container(
        decoration: BoxDecoration
        (
          image:DecorationImage
          (
            image:AssetImage('$image'),
            fit:BoxFit.cover,
          )
        ),
        child: Column(children:<Widget>[
          SizedBox(height:40),
          Center
          (
            child: FlatButton.icon
            (
              onPressed: ()async
              {
                dynamic result =await Navigator.pushNamed(context,'/location');  // dynamic is used when we don't know the datatype
                setState(() {
                  data ={'location':result['location'],'flag':result['flag'],'time':result['time'],'isDay':result['isDay']} ;
                });
              },
              icon:Icon(Icons.location_city,color:Colors.grey[200],size:50,),
              label:Text('Location',style:TextStyle(color:Colors.white,fontSize:30))
            )
          ),
          SizedBox(height: 180,),
          Center(
            child: Text
            (
              data['location'],
              style:TextStyle
              (
                fontSize: 40 ,
                color:Colors.white ,
                fontWeight:FontWeight.w500,
              )
            ),
          ),
          SizedBox(height:40,),
          Center(
            child: Text
            (
              data['time'],
              style:TextStyle
              (

                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50
              )
            ),
          )    
    
        ]),
      )
    );
  }
}
