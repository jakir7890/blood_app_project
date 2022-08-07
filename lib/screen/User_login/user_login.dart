import 'package:blood_app/screen/User_login/donner.dart';
import 'package:blood_app/screen/User_login/nedded.dart';
import 'package:flutter/material.dart';

class UserLoginScreen extends StatelessWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        
        appBar: AppBar(
          title: Text('Sign Up'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            
            children: [SizedBox(height: 20,),
               Padding(
                 padding:  EdgeInsets.only(left: 15,right: 15),
                 child: TabBar(
                     indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green),
                   unselectedLabelColor: Colors.black54,
                 
                 labelColor: Colors.white,
                 
                 indicatorColor: Colors.white,
                   tabs: [
                     Tab(
                       text: "Blood Donner",),
                   
                      Tab(
                       text: "Blood Needed"
                  
                     ),
                     
                     
                     
                   ],
                   
                   ),
               ),
              Container(
                height: 750,
                child:   TabBarView(
                  children: [
                    BloodDonner(),
                    BloodNeeded()
                
                  
                ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

