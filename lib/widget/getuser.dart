import 'package:blood_app/screen/homapage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

   GetUserName({ required this.documentId});


  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.
    collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot){
        if(snapshot.connectionState ==ConnectionState.done){
          Map<String, dynamic> data =
          snapshot.data!.data() as Map<String, dynamic> ;
          return Card(color: Colors.green.shade100,shadowColor: Colors.red.shade100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResuableRow(title: 'Name:', value: '${data['name']}'.toUpperCase()),
                  ResuableRow(title: 'Email:', value: '${data['email']}'),
                  ResuableRow(title: 'Phone Number: ', value: '${data['phonenumber']}'.toString()),
                  ResuableRow(title: 'Current upozila:', value: '${data['currentupozila']}'.toUpperCase()),
                
                ],
              ),
            ),
          );
        }
        return Text('Loading');
      }
      );
  }
}

