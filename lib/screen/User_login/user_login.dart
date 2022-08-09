import 'package:blood_app/screen/User_login/donner.dart';
import 'package:blood_app/screen/User_login/nedded.dart';
import 'package:flutter/material.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        bottom: TabBar(
          padding: EdgeInsets.only(left: 15,right: 15),
          controller: _tabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.green),
          unselectedLabelColor: Colors.black54,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: "Blood Donner",
            ),
            Tab(text: "Blood Needed"),
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 10,right: 10),
        child: TabBarView(
            controller: _tabController, children: [BloodDonner(), BloodNeeded()]),
      ),
    );
  }
}
