import 'package:blood_app/screen/forget_password.dart';
import 'package:blood_app/screen/homapage.dart';
import 'package:blood_app/screen/loginpage.dart';
import 'package:blood_app/screen/profilepage.dart';
import 'package:blood_app/screen/signuppage.dart';
import 'package:blood_app/screen/splashscreen.dart';
import 'package:blood_app/screen/user_screen.dart';
import 'package:blood_app/widget/custromdrowe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      // home: UserScreen(),
      initialRoute: '/',
       getPages: [
    GetPage(name: '/', page: () => Splashscreen()),
    GetPage(name: '/', page: () => UserScreen()),
    GetPage(name: '/', page: () => Homepage()),
    GetPage(name: '/', page: () => ProfilePage()),
    GetPage(name: '/', page: () => CustromDrower()),

    GetPage(name: '/', page: () => SignIn()),
    GetPage(name: '/', page: () => SignUp()),
    GetPage(name: '/', page: () => ForgetPassScreen()),
  ]
      
    );
  }
}
