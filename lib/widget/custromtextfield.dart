
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class TextFieldView extends StatelessWidget {
  
  const TextFieldView({
    Key? key, required this.title, required this.controller,
  }) : super(key: key);

  final String title;
 final controller;
 
  

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 25),
          child: Text(title,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 10,),
        Container(
          margin: EdgeInsets.only(left: 20,right: 20),
          child: Form(

            child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                 
                  hintStyle: TextStyle(
                    fontSize: 12
                      ),
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
                )),
          ),
        ),
      ],
    );
  }
}