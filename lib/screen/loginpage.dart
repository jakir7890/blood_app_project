import 'package:blood_app/screen/forget_password.dart';
import 'package:blood_app/screen/homapage.dart';
import 'package:blood_app/screen/user_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
   var _isVisible = false;
   FirebaseAuth auth = FirebaseAuth.instance;
   GlobalKey<FormState> fromkey = GlobalKey<FormState>();
   void validated(){
    if (fromkey.currentState!.validate()){
      print('Validated');

    }else{
      print('Not Validates');
    }
   }

   String? validatepass(value){
    if (value.isEmpty) {
      return "Required";
    }else if(value.length <6){
      return "Should be at least 6 character";
    }else if(value.length >15){
      return "Should not be more then 15 character";
    }
     else {
      return null;
    }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:50),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                   GestureDetector(
                      onTap: () {
                        Get.to(UserScreen());
                      },
                      child: Icon(Icons.arrow_back)),
                       SizedBox(width:20),
                  Text('Sign In',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
           SizedBox(height:250),
          
             
        
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
            padding:  EdgeInsets.only(left: 25),
            child: Text('Email',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 10,),
                  Padding(
                   padding:  EdgeInsets.only(left: 20,right: 20),
                    child: Form(
                      
                      autovalidateMode: AutovalidateMode.always,
                      key: fromkey,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                               controller: _emailController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                               
                                hintStyle: TextStyle(
                                  fontSize: 12,fontWeight: FontWeight.bold
                                    ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.blue),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.all(12),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                ),
                              ),
                              validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: "Required"),
                                  EmailValidator(errorText: "Not A Valid Email")
                                ]
                              ),
                              ),
                              Padding(
            padding:  EdgeInsets.only(top: 20,left: 10),
            child: Text('Password',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 10,),
                      Padding(
                        padding:  EdgeInsets.only(left: 20,right: 20),),

                               TextFormField(
                            
                              controller: _passwordController,
                              // keyboardType: TextInputType.text,
                              obscureText: _isVisible?false: true,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                     setState(() {
                                _isVisible = !_isVisible;
                              });
                                  },
                                  icon: Icon(
                                    _isVisible?Icons.visibility:
                                    Icons.visibility_off,
                                    color: Colors.grey,)
                                  ),
                               
                           
                                hintStyle: TextStyle(
                                   fontSize: 12,fontWeight: FontWeight.bold),
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
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      width: 1,
                                      style: BorderStyle.solid,
                                      
                                      color: Colors.grey),
                                ),
                              ),
                              validator: validatepass,
                              ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                
                padding: EdgeInsets.only(left: 20,right: 20),
                child: ElevatedButton(
                  onPressed: () async{
                    validated();
                    try{
                         final users= await    auth.signInWithEmailAndPassword(
                              email: _emailController.text, 
                              password: _passwordController.text.toString().trim(),
                              
                              );
                              if(users!=null){
                                 Get.to(Homepage());
                              }
                            }on FirebaseAuthException catch (e){
                              print(e.code);
                            };
                  //
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
                  child: Text('Log In',style: TextStyle(
                    color: Colors.white,fontSize: 25
                  ),
                
                    )
                  ),
              ),
               SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
               Get.to(ForgetPasswordPage());
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 200),
                  child: Text(
                    "Forgotten password?",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
             ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
               SizedBox(
                height: 10,
              ),             
                 ],
               ),     
      
        ),
      );
    
  }
}