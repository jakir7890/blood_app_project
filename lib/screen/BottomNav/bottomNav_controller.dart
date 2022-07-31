import 'package:blood_app/const/color.dart';
import 'package:blood_app/screen/BottomNav/blood_bank.dart';
import 'package:blood_app/screen/BottomNav/chat.dart';
import 'package:blood_app/screen/BottomNav/home.dart';
import 'package:blood_app/screen/BottomNav/profile.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  final screens = [
    Homepage(), 
    BloodBank(), 
    ChatScreen(), 
    ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      // appBar: AppBar(
      //   title: Text('Home'),
      //   backgroundColor: kSecondaryColor,
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   actions: [

      //   ],
      //   elevation: 0,
      // ),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.red,
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 12, fontWeight: FontWeight.w500))),
        child: NavigationBar(
          height: 60,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.bloodtype), label: ' Blood Bank'),
            NavigationDestination(
                icon: Icon(Icons.chat_bubble_outline), label: 'Chats'),
            NavigationDestination(
                icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
