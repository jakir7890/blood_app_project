

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        // backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Form(
         
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25),
                child: Text('Enter your Email and we will sent you a password reset link',
                style: TextStyle(
                  fontSize: 15,fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,),
              ),
              SizedBox(height: 20,),
        
               Padding(
                       padding: EdgeInsets.symmetric(horizontal: 25),
                       child: TextFormField(
                         controller: emailController,
                         cursorColor: Colors.white,
                         textInputAction: TextInputAction.done,
                         decoration: InputDecoration(
                          // labelText: 'Email',
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.black),
                             borderRadius: BorderRadius.circular(12)
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.deepPurple),
                             borderRadius: BorderRadius.circular(12)
                           ),
                           hintText: 'Enter Your Email:',
                           fillColor: Colors.white,
                           filled: true
                         ),
                       
                       ),
                       ),
                       SizedBox(height: 10,),
        
                       MaterialButton(
                         onPressed: passwordReset,
                         child: Text('Reset Password',style: TextStyle(color: Colors.white),),
                         color: Color(0xFF660000),
                         )
        
            ],
          ),
        ),
      ),
    );
  }

  Future passwordReset() async {
   try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
      email: emailController.text.trim());
        showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          content: Text('Password reset link sent! Check your email'),
        );
      }
      );
   } on FirebaseAuthException catch (e) {
     print(e);
     showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      }
      );
   }
     
  } 
}
