// import 'package:blood_app/const/color.dart';
// import 'package:flutter/material.dart';

// class ForgetPassScreen extends StatefulWidget {
//   const ForgetPassScreen({Key? key}) : super(key: key);

//   @override
//   State<ForgetPassScreen> createState() => _ForgetPassScreenState();
// }

// class _ForgetPassScreenState extends State<ForgetPassScreen> {
//    final emailController = TextEditingController();

//   @override
//   void dispose() {
//     emailController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Forgetten Password",
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: AppColor.kPrimaryColor,
//         elevation: 0.0,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Spacer(),
//               Text(
//                 "Reset Password",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
//               ),
//               Text(
//                   "Enter your email adress below and we'll send you a link to reset your password"),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                     borderSide: BorderSide(
//                       width: 2,
//                       color: AppColor.buttonColor,
//                     ),
//                   ),
//                   labelText: "E-Mail",
//                   hintText: "Type your E-mail",
//                   suffixIcon: IconTheme(
//                       data: IconThemeData(color: AppColor.buttonColor),
//                       child: Icon(
//                         Icons.email,
//                       )),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                     borderSide: BorderSide(
//                       color: AppColor.buttonColor,
//                       width: 2.0,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 25,
//               ),
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     elevation: 8.0,
//                     primary: AppColor.buttonColor,

//                     minimumSize: Size.fromHeight(
//                         50), // fromHeight use double.infinity as width and 40 is the height
//                   ),
//                   onPressed: () {},
//                   child: Text(
//                     "Send",
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   )),
//               Spacer()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  // final formKey = GlobalKey<FormState>();
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
        backgroundColor: Colors.deepOrange,
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
                textAlign: TextAlign.center,),
              ),
              SizedBox(height: 10,),
        
               Padding(
                       padding: EdgeInsets.symmetric(horizontal: 25),
                       child: TextFormField(
                         controller: emailController,
                         cursorColor: Colors.white,
                         textInputAction: TextInputAction.done,
                         decoration: InputDecoration(
                          // labelText: 'Email',
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.white),
                             borderRadius: BorderRadius.circular(12)
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.deepPurple),
                             borderRadius: BorderRadius.circular(12)
                           ),
                           hintText: 'Enter Your Email',
                           fillColor: Colors.grey,
                           filled: true
                         ),
                       
                       ),
                       ),
                       SizedBox(height: 10,),
        
                       MaterialButton(
                         onPressed: passwordReset,
                         child: Text('Reset Password',),
                         color: Colors.deepPurple,
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
