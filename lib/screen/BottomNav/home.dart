import 'package:blood_app/screen/favorite_details.dart';
import 'package:blood_app/screen/signuppage.dart';
import 'package:blood_app/widget/custromdrowe.dart';
import 'package:blood_app/widget/getuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> docIDs = [];

  Future getDocid() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((Document) {
              // print(Document.reference);
              docIDs.add(Document.reference.id);
            }));
  }

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      drawer: CustromDrower(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: FutureBuilder(
            future: getDocid(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: docIDs.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      ListTile(
                        title: GetUserName(documentId: docIDs[index]),
                      )
                    ],
                  );
                },
              );
            },
          ))
        ],
      ),

    );
  }

  Widget buildUser(User users) => ListTile(
        leading: CircleAvatar(child: Text('${users.selectarea}')),
        title: Text(users.name),
        subtitle: Text(users.phonenumber.toString()),
        trailing: Text(users.email),
      );
}

Stream<List<User>> readusers() =>
    FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

class ResuableRow extends StatelessWidget {
  final String title, value;
  final String image;
  //final IconData? icon;
  final Widget? child;

  ResuableRow({Key? key, required this.title, required this.value, this.child, this.image='assets/images/blood.png'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    child: child,
                  ),
                  SizedBox(width: 5,),
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(value),
                    ],
                  ),
                ],
              ),
              // SizedBox(width: 50,),


            ],
          ),
          Positioned(
            left: -25,
            top: 60,
            child: GestureDetector(
                onTap: () {
                  Get.to(FavoriteScreen());
                },
                child: Image.asset(image,width: 25,height: 25,)),
          ),
        ],

      ),
    );
  }
}
