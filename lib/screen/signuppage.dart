import 'package:blood_app/screen/user_screen.dart';
import 'package:blood_app/widget/custromtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

   String? valueChoose1;
   String? valueChoose2;
  List listArea = [
    "Dhaka","Brahmanbaria","Chittagong","Uttara","Mirpur",
  ];
  List listGroup = [
    "A +","A -","B +","B -","AB +","AB -",
  ];
   var _isVisible = false;
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             SizedBox(height:50),
          Padding(
            padding:  EdgeInsets.only(left: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(UserScreen());
                  },
                  child: Icon(Icons.arrow_back)),
                 SizedBox(width:20),
              Text('Sign Up',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
         SizedBox(height:20),
         
             Padding(
               padding:  EdgeInsets.only(left: 25,right: 20),
               child: Text(
                  'Lets take blood or donate blood\nwith creating an account',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  
                ),
             ),
              SizedBox(height: 20,),
              
      
              TextFieldView(
                title: 'Name',
              ),
              SizedBox(height: 10,),
                TextFieldView(
                title: 'Email Address',
              ),
              SizedBox(height: 10,),
                TextFieldView(
                title: 'Phone Number',
              ),
              SizedBox(height: 10,),
             
               Column(crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
          padding:  EdgeInsets.only(left: 25),
          child: Text('Password',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 10,),
                   Container(
                    margin: EdgeInsets.only(left: 18,right: 18),
                    child: TextField(
                        
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
              SizedBox(height: 10,),
               Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
          padding:  EdgeInsets.only(left: 25),
          child: Text('Select Area',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
        ),
        // SizedBox(height: 5,),
          Padding(
            padding:  EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.only(left: 16,right: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 1),
                borderRadius: BorderRadius.circular(10)
              ),
              child: DropdownButton(
               
                icon: Icon(Icons.arrow_drop_down),
                underline: SizedBox(),
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black
                ),
                iconSize: 30,
                isExpanded: true,
                value: valueChoose1,
                 onChanged: (newValue){
                  setState(() {
                    valueChoose1 = newValue as String?;
                  });
                },
                items: listArea.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem)
                    );
                }
                ).toList(), 
               
                ),
            ),
          ),
                  
                ],
              ),

              // SizedBox(height: 5,),
              
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
          padding:  EdgeInsets.only(left: 25),
          child: Text('Blood Group',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
        ),
        // SizedBox(height: 5,),
        Padding(
            padding:  EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.only(left: 16,right: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 1),
                borderRadius: BorderRadius.circular(15)
              ),
              child: DropdownButton(
              
                icon: Icon(Icons.arrow_drop_down),
                underline: SizedBox(),
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black
                ),
                iconSize: 30,
                isExpanded: true,
                value: valueChoose2,
                 onChanged: (newValue){
                  setState(() {
                    valueChoose2 = newValue as String?;
                  });
                },
                items: listGroup.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem)
                    );
                }
                ).toList(), 
               
                ),
            ),
          ),
                  
                ],
              ),
              // SizedBox(height: 10,),
               TextFieldView(
                title: 'Current Upazila',
              ),

             SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                
                padding: EdgeInsets.only(left: 20,right: 20),
                child: ElevatedButton(
                  onPressed: () {
                  
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
                  child: Text('Sign Up ',style: TextStyle(
                  color: Colors.white,fontSize: 25
                ),
                
                    )
                  ),
              ),
              SizedBox(height: 20,)
            
            
          ],
        ),
      ),
    );
  }
}