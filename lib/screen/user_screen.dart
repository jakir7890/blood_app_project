import 'package:blood_app/const/color.dart';
import 'package:blood_app/screen/loginpage.dart';
import 'package:blood_app/screen/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Spacer(),
              Text("Wellcome to The Blood App", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
              Text("Take blood, donate blood, save live"),
              SizedBox(height: 40,),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColor.kPrimaryColor,
                  image: DecorationImage(image: AssetImage("assets/images/blood.png",)),
                  shape: BoxShape.circle,
                  
                    
                ),
              ),
              SizedBox(height: 5,),
              Text("Blood",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.buttonColor)),
              Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8.0,
                    primary: AppColor.buttonColor,

                    minimumSize: Size.fromHeight(
                        50), // fromHeight use double.infinity as width and 40 is the height
                  ),
                  onPressed: () {
                    Get.to(SignIn());
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  SizedBox(height: 20,),
                  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8.0,
                    primary: AppColor.buttonColor,

                    minimumSize: Size.fromHeight(
                        50), // fromHeight use double.infinity as width and 40 is the height
                  ),
                  onPressed: () {
                    Get.to(SignUp());
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}