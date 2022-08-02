import 'dart:io';

import 'package:blood_app/src/app.dart';
import 'package:blood_app/src/hive_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';


Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // Directory directory=await getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  // Hive.registerAdapter<Blood>(BloodAdapter());
  // await Hive.openBox('blood');
  await Firebase.initializeApp();
  runApp( MyApp());
}

