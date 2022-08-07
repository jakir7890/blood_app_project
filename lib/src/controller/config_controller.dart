import 'package:blood_app/screen/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfigController extends GetxController {
  final _auth = FirebaseAuth.instance;

  Future<void> initConfig() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await initFirebase();
    } catch (e) {
      print(e);
    }
  }

  void checkUserAuth() async {
    try {
      print(_auth.currentUser);
      await Future.delayed(Duration(seconds: 2));
      _auth.currentUser != null
          ? Get.offAll(() => BottomAppBar())
          : Get.offAll(() =>SignIn());
    } catch (e) {}
  }

  Future<void> initFirebase() async {
    await Firebase.initializeApp();
    print('Initialized firebase');
  }
}