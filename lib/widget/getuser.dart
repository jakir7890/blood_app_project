import 'package:blood_app/screen/BottomNav/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: 10,
                ),
                Card(
                  color: Colors.green.shade100,
                  shadowColor: Colors.red.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ResuableRow(
                          title: 'Name:',
                          value: '${data['name']}',
                          icon: Icons.favorite_border,
                        ),
                        ResuableRow(
<<<<<<< HEAD
                            title: 'Phone Number: ',
                            value: '${data['phonenumber']}'.toString()),
                        ResuableRow(
                            title: 'Union:',
                            value: '${data['union']}'),
=======
                            //     child: Positioned(
                            //         left: -40,
                            //         top: 10,
                            //         child: CircleAvatar(
                            //           backgroundColor: Colors.green,
                            //           child: Text('A+'),
                            //         )
                            //     ),
                            title: 'Hospital Name:',
                            value: '${data['hospitalname']}'),
                        ResuableRow(
                            title: 'Phone Number: ',
                            value: '${data['phonenumber']}'.toString()),
                        ResuableRow(
                            title: 'Current Union:',
                            value: '${data['currentupozila']}'),
>>>>>>> 3e0d19c73e3a7b2790eb36ebd3ff2d0a7464c94f
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Positioned(
                    left: -15,
                    top: 75,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        '${data['bloodgroup']}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            );
          }
          return Text('Loading');
        });
  }
}
