
import 'package:blood_app/screen/BottomNav/bottomNav_controller.dart';
import 'package:blood_app/screen/user_screen.dart';
import 'package:blood_app/src/app.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  try {

  } catch (e) {
    print('Init failed' + e.toString());
  }
  runApp( MyApp());
  _init();
}


_init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("userID");
  if (token != null) {
    print('Token: $token');
    Get.offAll(BottomNavBar());
  } else {
    Get.offAll(UserScreen());
  }
}