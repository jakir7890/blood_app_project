import 'package:blood_app/screen/favorite_details.dart';
import 'package:blood_app/screen/signuppage.dart';
import 'package:blood_app/src/controller/hive_manage_controller.dart';
import 'package:blood_app/widget/custromdrowe.dart';
import 'package:blood_app/widget/getuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

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
                  final item = docIDs[index];
                  return Stack(
                    children: [
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: GetUserName(documentId: docIDs[index]),
                        ),
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

// Widget buildUser(User users) => ListTile(
//       leading: CircleAvatar(child: Text('${users.selectarea}')),
//       title: Text(users.name),
//       subtitle: Text(users.phonenumber.toString()),
//       trailing: Text(users.email),
//     );
}

class ResuableRow extends StatefulWidget {
  final String title, value;
  final IconData? icon;
  final Widget? child;

  ResuableRow({
    Key? key,
    required this.title,
    required this.value,
    this.child,
    this.icon,
  }) : super(key: key);

  @override
  State<ResuableRow> createState() => _ResuableRowState();
}

class _ResuableRowState extends State<ResuableRow> {
  // final hiveManageC = Get.put(HiveManageController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Container(
                child: widget.child,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.value),
              // SizedBox(width: 50,),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {},
              //onTap: ()=>hiveManageC.manageBlood(blood: ),
              child: Icon(widget.icon),
              // child: ValueListenableBuilder(
              //   builder:
              //       (BuildContext context, dynamic value, Widget? child) {
              //     return Container(child: Icon(Icons.favorite_border_outlined));
              //   },
              //   valueListenable: hiveManageC.bloodBox.listenable(),
              //   // child: Icon(widget.icon)
              // )
            ),
          ),
        ],
      ),
    );
  }
}
