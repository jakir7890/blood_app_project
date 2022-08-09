// ignore_for_file: unnecessary_null_comparison

import 'package:blood_app/screen/BottomNav/blood_bank.dart';
import 'package:blood_app/screen/BottomNav/bottomNav_controller.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BloodNeeded extends StatefulWidget {
  const BloodNeeded({Key? key}) : super(key: key);

  @override
  State<BloodNeeded> createState() => _BloodNeededState();
}

class _BloodNeededState extends State<BloodNeeded> {
  String? valueChoose1;
  String? valueChoose2;
  String? valueChoose3;
  List<String> listArea = [
    "Dhaka",
    "Brahmanbaria",
    "Chittagong",
    "Uttara",
    "Mirpur",
  ];
  List<String> listGroup = [
    "A +",
    "A -",
    "B +",
    "B -",
    "AB +",
    "AB -",
  ];
  // List<String> ofType = ["Donner", " Blood Need"];
  var _isVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  // TextEditingController currentUnionController = TextEditingController();
  TextEditingController selectdistrictController = TextEditingController();
  TextEditingController bloodgroupController = TextEditingController();
  // TextEditingController typeofController = TextEditingController();
  // TextEditingController hospitalController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
// sendUserDataDB() async{
//   // final FirebaseAuth _auth = FirebaseAuth.instance;
//   // var currentUser = _auth.currentUser;
//   CollectionReference _collectionRef = await FirebaseFirestore.instance.collection("users");
//   return _collectionRef.doc().set({
//     "email":_emailController.text,
//     "name":_nameController.text,
//     "phone":_phoneController.text,
//     "currentupozila":_currentUpazelaController.text,
//     "selectarea":_selectareaController.text,
//     "bloodgroup":_bloodgroupController.text,
//     "type":_typeofController.text,
//   }).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar()))).
//   catchError((error)=> print("Something is wrong. $error"));
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            // Padding(
            //   padding: EdgeInsets.only(left: 20),
            //   child: Row(
            //     children: [
            //       GestureDetector(
            //           onTap: () {
            //             Get.to(UserScreen());
            //           },
            //           child: Icon(Icons.arrow_back)),
            //       SizedBox(width: 20),
            //       Text(
            //         'Sign Up',
            //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.only(left: 25, right: 20),
              child: Text(
                "Let's needed blood\nwith creating an account",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),

            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.only(left: 25),
                    //   child: Text(
                    //     'Select Of Type',
                    //     style: TextStyle(
                    //         fontSize: 12, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.all(16.0),
                    //   child: TextField(
                    //     controller: typeofController,
                    //     readOnly: true,
                    //     decoration: InputDecoration(
                    //         hintText: "Choose of type",
                    //         hintStyle: TextStyle(fontSize: 12),
                    //         border: OutlineInputBorder(),
                    //         filled: true,
                    //         fillColor: Colors.white,
                    //         contentPadding: EdgeInsets.all(12),
                    //         enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10),
                    //           borderSide: BorderSide(
                    //               width: 1,
                    //               style: BorderStyle.solid,
                    //               color: Colors.grey),
                    //         ),
                    //         // hintText: "choose your gender",
                    //         suffixIcon: Padding(
                    //           padding: EdgeInsets.only(left: 15, right: 10),
                    //           child: DropdownButton<String>(
                    //               underline: SizedBox(),
                    //               icon: Icon(Icons.expand_more_outlined),
                    //               // hint: Text('Choose of type',style: TextStyle(
                    //               //   color:Colors.black,fontWeight: FontWeight.bold
                    //               // ),textAlign: TextAlign.center,),

                    //               items: ofType.map((String value) {
                    //                 return DropdownMenuItem<String>(
                    //                   value: value,
                    //                   child: new Text(value),
                    //                   onTap: () {
                    //                     setState(() {
                    //                       typeofController.text = value;
                    //                     });
                    //                   },
                    //                 );
                    //               }).toList(),
                    //               onChanged: (_) {}),
                    //         )),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 25),
                    //   child: Text(
                    //     'hospital name',
                    //     style: TextStyle(
                    //         fontSize: 12, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 20, right: 20),
                    //   child: TextField(
                    //       controller: hospitalController,
                    //       keyboardType: TextInputType.text,
                    //       decoration: InputDecoration(
                    //         hintStyle: TextStyle(
                    //             fontSize: 12, fontWeight: FontWeight.bold),
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10),
                    //           borderSide: BorderSide(
                    //               width: 1,
                    //               style: BorderStyle.solid,
                    //               color: Colors.blue),
                    //         ),
                    //         filled: true,
                    //         fillColor: Colors.white,
                    //         contentPadding: EdgeInsets.all(12),
                    //         enabledBorder: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(10),
                    //           borderSide: BorderSide(
                    //               width: 1,
                    //               style: BorderStyle.solid,
                    //               color: Colors.grey),
                    //         ),
                    //       )),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: Colors.blue),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(12),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: Colors.grey),
                            ),
                          )),
                    ),
                  ],
                ),
                // SizedBox(height: 10,),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Email',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.grey),
                    ),
                  )),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Phone Number',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 18, right: 18),
              child: TextField(
                  controller: phoneController,

                  // keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.grey),
                    ),
                  )),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'District',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: selectdistrictController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        width: 1, style: BorderStyle.solid, color: Colors.grey),
                  ),
                  // hintText: "choose your gender",
                ),
              ),
            ),

            // SizedBox(height: 5,),

            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Blood Group',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            // SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: bloodgroupController,
                readOnly: true,
                decoration: InputDecoration(
                    hintText: "Select Blood Group",
                    hintStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.grey),
                    ),
                    // hintText: "choose your gender",
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: DropdownButton<String>(
                          underline: SizedBox(),
                          icon: Icon(Icons.expand_more_outlined),
                          items: listGroup.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                              onTap: () {
                                setState(() {
                                  bloodgroupController.text = value;
                                });
                              },
                            );
                          }).toList(),
                          onChanged: (_) {}),
                    )),
              ),
            ),
            // SizedBox(height: 10,),
            // Padding(
            //   padding: EdgeInsets.only(left: 25),
            //   child: Text(
            //     'Current Union',
            //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   margin: EdgeInsets.only(left: 18, right: 18),
            //   child: TextField(
            //       controller: currentUnionController,

            //       // keyboardType: TextInputType.text,
            //       decoration: InputDecoration(
            //         hintStyle:
            //             TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            //         border: OutlineInputBorder(
            //           borderSide: BorderSide(
            //               width: 1,
            //               style: BorderStyle.solid,
            //               color: Colors.blue),
            //         ),
            //         filled: true,
            //         fillColor: Colors.white,
            //         contentPadding: EdgeInsets.all(12),
            //         enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10),
            //           borderSide: BorderSide(
            //               width: 1,
            //               style: BorderStyle.solid,
            //               color: Colors.grey),
            //         ),
            //       )),
            // ),
            // SizedBox(
            //   height: 10,
            // ),

            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'Password',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 18, right: 18),
              child: TextField(
                  controller: passwordController,

                  // keyboardType: TextInputType.text,
                  obscureText: _isVisible ? false : true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: Icon(
                          _isVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        )),
                    hintStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.grey),
                    ),
                  )),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                  onPressed: () async {
                    final user = User(
                        name: nameController.text,
                        phonenumber: int.parse(phoneController.text),
                        selectdistrict: selectdistrictController.text,
                        bloodgroup: bloodgroupController.text,
                        email: emailController.text,
                        // hospitalname: hospitalController.text,
                        // union: currentUnionController.text
                        );
                    neededUser(user);
                    Get.to(BottomNavBar());
                    try {
                      final users = await auth.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text.toString().trim(),
                      );
                      if (users != null) {
                        Get.to(BottomNavBar());
                      }
                    } on FirebaseAuthException catch (e) {
                      print(e.code);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF660000),
                    padding: EdgeInsets.all(10),
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Submit ',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 30, right: 30),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "Don't have an account?",
            //         style: TextStyle(
            //           fontSize: 15.0,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.red,
            //         ),
            //       ),
            //       SizedBox(
            //         width: 20,
            //       ),
            //       GestureDetector(
            //         child: Text(
            //           " Sign In",
            //           style: TextStyle(
            //             fontSize: 20.0,
            //             fontWeight: FontWeight.w600,
            //             color: Colors.green,
            //           ),
            //         ),
            //         onTap: () {
            //           Get.to(SignIn());
            //         },
            //       )
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}

Future neededUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection('blood-needed').doc();
  user.id = docUser.id;
  final json = user.toJson();
  await docUser.set(json);
}

class User {
  String id, name, email, 
  // hospitalname,
  //  union,
    selectdistrict, bloodgroup;
  int phonenumber;

  User(
      {this.id = '',
      required this.name,
      required this.selectdistrict,
      required this.email,
      required this.bloodgroup,
      // required this.hospitalname,
      // required this.union,
      required this.phonenumber
      });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'selectarea': selectdistrict,
        'bloodgroup': bloodgroup,
        'phonenumber': phonenumber,
        'email': email,
        // "hospitalname": hospitalname,
        // "union": union
      };

  // select of type donner, blood need

  static User fromJson(Map<String, dynamic> json) => User(
      name: json['name'],
      selectdistrict: json['selectarea'],
      email: json['email'],
      bloodgroup: json['bloodgroup'],
      phonenumber: json['phonenumber'],
      // hospitalname: json['hospitalname'],
      // union: json['union']
      );
}





// import 'package:blood_app/screen/BottomNav/home.dart';
// import 'package:blood_app/screen/loginpage.dart';
// import 'package:blood_app/screen/user_screen.dart';
// import 'package:blood_app/widget/custromtextfield.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({ Key? key }) : super(key: key);

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {

//    String? valueChoose1;
//    String? valueChoose2;
//    String? valueChoose3;
//   List listArea = [
//     "Dhaka","Brahmanbaria","Chittagong","Uttara","Mirpur",
//   ];
//   List listGroup = [
//     "A +","A -","B +","B -","AB +","AB -",
//   ];
//   List ofType = [
//     "Donner", " Blood Need"
//   ];
//    var _isVisible = false;
//     TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _phoneController = TextEditingController();
//   TextEditingController _currentUpazelaController = TextEditingController();
//   TextEditingController _selectareaController = TextEditingController();
//   TextEditingController _bloodgroupController = TextEditingController();
//    FirebaseAuth auth = FirebaseAuth.instance;
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//              SizedBox(height:50),
//           Padding(
//             padding:  EdgeInsets.only(left: 20),
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Get.to(UserScreen());
//                   },
//                   child: Icon(Icons.arrow_back)),
//                  SizedBox(width:20),
//               Text('Sign Up',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//               ],
//             ),
//           ),
//          SizedBox(height:20),
         
//              Padding(
//                padding:  EdgeInsets.only(left: 25,right: 20),
//                child: Text(
//                   'Lets take blood or donate blood\nwith creating an account',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  
//                 ),
//              ),
//               SizedBox(height: 20,),
              
      
//               Column(
//                 children: [
//                   SizedBox(height: 10,),
//                Column(crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//           padding:  EdgeInsets.only(left: 25),
//           child: Text('Select Of Type',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
//         ),
//           Padding(
//             padding:  EdgeInsets.all(16.0),
//             child: Container(
//               padding: EdgeInsets.only(left: 16,right: 16),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey,width: 1),
//                 borderRadius: BorderRadius.circular(10)
//               ),
//               child: DropdownButton(
               
//                 icon: Icon(Icons.arrow_drop_down),
//                 underline: SizedBox(),
//                 style: TextStyle(
//                   fontSize: 15,fontWeight: FontWeight.bold,
//                   color: Colors.black
//                 ),
//                 iconSize: 30,
//                 isExpanded: true,
//                 value: valueChoose3,
//                  onChanged: (newValue){
//                   setState(() {
//                     valueChoose3 = newValue as String?;
//                   });
//                 },
//                 items: ofType.map((valueItem) {
//                   return DropdownMenuItem(
//                     value: valueItem,
//                     child: Text(valueItem)
//                     );
//                 }
//                 ).toList(), 
               
//                 ),
//             ),
//           ),
                  
//                 ],
//               ),
//               // SizedBox(height: 10,),
//                   TextFieldView(
//                     controller: _nameController,
//                     title: 'Name',
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10,),
//                Column(crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                    Padding(
//             padding:  EdgeInsets.only(left: 25),
//             child: Text('Email',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
//           ),
//           SizedBox(height: 10,),
//                   Container(
//                     margin: EdgeInsets.only(left: 20,right: 20),
//                     child: TextField(
//                          controller: _emailController,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
                         
//                           hintStyle: TextStyle(
//                             fontSize: 12,fontWeight: FontWeight.bold
//                               ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(
//                                 width: 1,
//                                 style: BorderStyle.solid,
//                                 color: Colors.blue),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding: EdgeInsets.all(12),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             borderSide: BorderSide(
//                                 width: 1,
//                                 style: BorderStyle.solid,
//                                 color: Colors.grey),
//                           ),
//                         )),
//                   ),
//                 ],
//               ),
             
//               SizedBox(height: 10,),
//                 TextFieldView(
//                   controller: _phoneController,
//                 title: 'Phone Number',
                
//               ),
//               SizedBox(height: 10,),
             
//                Column(crossAxisAlignment: CrossAxisAlignment.start,
//                  children: [
//                    Padding(
//           padding:  EdgeInsets.only(left: 25),
//           child: Text('Password',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
//         ),
//         SizedBox(height: 10,),
//                    Container(
//                     margin: EdgeInsets.only(left: 18,right: 18),
//                     child: TextField(
//                        controller: _passwordController,
                        
//                         // keyboardType: TextInputType.text,
//                         obscureText: _isVisible?false: true,
//                         decoration: InputDecoration(
//                           suffixIcon: IconButton(
//                             onPressed: () {
//                                setState(() {
//                           _isVisible = !_isVisible;
//                         });
//                             },
//                             icon: Icon(
//                               _isVisible?Icons.visibility:
//                               Icons.visibility_off,
//                               color: Colors.grey,)
//                             ),
                         
                     
//                           hintStyle: TextStyle(
//                              fontSize: 12,fontWeight: FontWeight.bold),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 width: 1,
//                                 style: BorderStyle.solid,
//                                 color: Colors.blue),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding: EdgeInsets.all(12),
//                           enabledBorder: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(10),
                           
//                             borderSide: BorderSide(
//                                 width: 1,
//                                 style: BorderStyle.solid,
//                                 color: Colors.grey),
//                           ),
//                         )),
//               ),
//                  ],
//                ),
//               SizedBox(height: 10,),
//                Column(crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//           padding:  EdgeInsets.only(left: 25),
//           child: Text('Select Area',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
//         ),
//           Padding(
//             padding:  EdgeInsets.all(16.0),
//             child: Container(
//               padding: EdgeInsets.only(left: 16,right: 16),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey,width: 1),
//                 borderRadius: BorderRadius.circular(10)
//               ),
//               child: DropdownButton(
               
//                 icon: Icon(Icons.arrow_drop_down),
//                 underline: SizedBox(),
//                 style: TextStyle(
//                   fontSize: 15,fontWeight: FontWeight.bold,
//                   color: Colors.black
//                 ),
//                 iconSize: 30,
//                 isExpanded: true,
//                 value: valueChoose1,
//                  onChanged: (newValue){
//                   setState(() {
//                     valueChoose1 = newValue as String?;
//                   });
//                 },
//                 items: listArea.map((valueItem) {
//                   return DropdownMenuItem(
//                     value: valueItem,
//                     child: Text(valueItem)
//                     );
//                 }
//                 ).toList(), 
               
//                 ),
//             ),
//           ),
                  
//                 ],
//               ),

//               // SizedBox(height: 5,),
              
//               Column(crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//           padding:  EdgeInsets.only(left: 25),
//           child: Text('Blood Group',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
//         ),
//         // SizedBox(height: 5,),
//         Padding(
//             padding:  EdgeInsets.all(16.0),
//             child: Container(
//               padding: EdgeInsets.only(left: 16,right: 16),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey,width: 1),
//                 borderRadius: BorderRadius.circular(15)
//               ),
//               child: DropdownButton(
              
//                 icon: Icon(Icons.arrow_drop_down),
//                 underline: SizedBox(),
//                 style: TextStyle(
//                   fontSize: 15,fontWeight: FontWeight.bold,
//                   color: Colors.black
//                 ),
//                 iconSize: 30,
//                 isExpanded: true,
//                 value: valueChoose2,
//                  onChanged: (newValue){
//                   setState(() {
//                     valueChoose2 = newValue as String?;
//                   });
//                 },
//                 items: listGroup.map((valueItem) {
//                   return DropdownMenuItem(
//                     value: valueItem,
//                     child: Text(valueItem)
//                     );
//                 }
//                 ).toList(), 
               
//                 ),
//             ),
//           ),
                  
//                 ],
//               ),
//               // SizedBox(height: 10,),
//                TextFieldView(
//                 controller: _currentUpazelaController,
//                 title: 'Current Upazila',
//               ),

//              SizedBox(height: 20,),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 60,
                
//                 padding: EdgeInsets.only(left: 20,right: 20),
//                 child: ElevatedButton(
//                   onPressed: ()
//                   async 
//                   {
//                     final user= User(
//                       name: _nameController.text,
//                       phonenumber: int.parse(_phoneController.text),
//                       currentupozila: _currentUpazelaController.text,
//                       selectarea: _selectareaController.text,
//                       bloodgroup: _bloodgroupController.text,
//                       email: _emailController.text, 
//                     );
//                     createUser(user);
//                      Get.to(Homepage());
//                   try{
//                             final users= await   auth.createUserWithEmailAndPassword(
//                               email: _emailController.text, 
//                               password: _passwordController.text.toString().trim(),
                              
//                               );
//                               if(users!=null){
//                                 Get.to(Homepage());

//                               }
//                             }on FirebaseAuthException catch (e){
//                               print(e.code);
//                             };
//                   },
//                     style: ElevatedButton.styleFrom(
//             primary: Color(0xFF660000),
//             padding: EdgeInsets.all(10),
      
//             textStyle: TextStyle(
//                 fontSize: 20,
                
//             ),
//              shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10), 
//           ),
           
//           ),
//                   child: Text('Sign Up ',style: TextStyle(
//                   color: Colors.white,fontSize: 25
//                 ),
                
//                     )
//                   ),
//               ),
//               SizedBox(height: 20,),
//                Padding(
//                  padding:  EdgeInsets.only(left: 30,right: 30),
//                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                  children: [
//                                    Text(
//                                      "Don't have an account?",
//                                      style: TextStyle(
//                                        fontSize: 15.0,
//                                        fontWeight: FontWeight.w600,
//                                        color: Colors.red,
//                                      ),
//                                    ),
//                                    SizedBox(width: 20,),
//                                    GestureDetector(
//                                      child: Text(
//                                        " Sign In",
//                                        style: TextStyle(
//                                          fontSize: 20.0,
//                                          fontWeight: FontWeight.w600,
//                                          color: Colors.green,
//                                        ),
//                                      ),
//                                      onTap: () {
//                                        Get.to(SignIn());
//                                      },
//                                    )
//                                  ],
//                                ),
//                ),
//                   SizedBox(height: 20,),  
//           ],
//         ),
//       ),
//     );
//   }
// }


// Future createUser(User user) async {
//   final docUser = FirebaseFirestore.instance.collection('users').doc();
//   user.id = docUser.id;
//   final json = user.toJson();
//   await docUser.set(json);
// }

// class User{
//   String id, name,email,
//   selectarea,bloodgroup, 
//   currentupozila;
//   int phonenumber;

//   User(
//     {this.id = '',
//     required this.name,
//     required this.selectarea,
//     required this.email,
//     required this.bloodgroup, 
//     required this.currentupozila,
//     required this.phonenumber}
//   );

//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'name': name,
//     'selectarea': selectarea,
//     'bloodgroup': bloodgroup,
//     'currentupozila': currentupozila,
//     'phonenumber': phonenumber,
//     'email': email,
//   };

//   // select of type donner, blood need

//   static User fromJson(Map<String, dynamic> json) => User(
//     name: json['name'], 
//     selectarea: json['selectarea'], 
//     email: json['email'], 
//     bloodgroup: json['bloodgroup'], 
//     currentupozila: json['currentupozila'], 
//     phonenumber: json['phonenumber']);
// }

