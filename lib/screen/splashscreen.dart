import 'dart:async';
import 'package:blood_app/screen/user_screen.dart';
import 'package:flutter/material.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({ Key? key }) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
_SplashscreenState(){
  new Timer(
    Duration(seconds: 3), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context)=>UserScreen()), (route) => false
          );
      });
    },
    );
}

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Center(
            child: Container(alignment: Alignment.center,
            padding: EdgeInsets.only(left: 140),
              height:200,
              width: 200,
             decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage('assets/images/blood.png',),
               fit: BoxFit.cover)
             ),
                
            ),
          ),
          Text('Donate Blood',style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold
          ),)
        ],
      ),
      
     
    );
    
  }
}