
import 'package:blood_app/screen/BottomNav/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustromDrower extends StatelessWidget {
  const CustromDrower({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          
          Padding(
            padding:  EdgeInsets.all(10),
            child: DrawerHeader(decoration: BoxDecoration(
               boxShadow: [
                   BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                    ), 
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), 
                  
                  ], 
              
              gradient: LinearGradient(colors: [
                Colors.white70,
                Colors.white70,
              ]),
              borderRadius: BorderRadius.circular(10)
            ),
        
              child: Container(
                child: Column(
                  children: [
                    Material(elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: Image.asset('assets/icons/profile_icon.png',
                      height: 90,width: 90,),
                    ),
                    SizedBox(height: 10,),
                    Text("Pial",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
              )
              ),
          ),
         
          CustomListTitle(
          'Home',(){},Icons.home
          ),
          SizedBox(height: 15,),
           CustomListTitle(
          'Person',(){
            Get.to(ProfilePage());
          },Icons.person
          ),
          SizedBox(height: 15,),
          CustomListTitle(
          'Blood Donation',(){},Icons.assignment
          ),
          SizedBox(height: 15,),
          CustomListTitle(
          'Policy',(){},Icons.assignment
          ),
          SizedBox(height: 15,),
           CustomListTitle(
          'About',(){},Icons.error_outline
          ),
          SizedBox(height: 15,),
           CustomListTitle(
          'Settings',(){},Icons.settings
          ),
          SizedBox(height: 15,),
           CustomListTitle(
          'Log Out',(){},Icons.logout
          ),
        
        ],
      ),
    );
  }
}

class CustomListTitle extends StatelessWidget{

final  IconData icons;
final  String text;
 final VoidCallback press;

  CustomListTitle(this.text,this.press, this.icons);

  @override
  Widget build(BuildContext context) {
  return Container(
    // decoration: BoxDecoration(
    //   border: Border(bottom:BorderSide(color: Colors.grey.shade300))
    // ),
    
    child: InkWell(
      splashColor: Colors.orange,
      onTap: press,
      child: Container(
        height: 40,
        child: Row(
          children: [
            SizedBox(width: 20,),
            Icon(icons,size: 30,),
            SizedBox(width: 25,),
            Text(text,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),

          ],
        ),
      ),
    ),
  );    
  }
}