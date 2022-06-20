import 'package:blood_app/const/color.dart';
import 'package:flutter/material.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgetten Password",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: AppColor.kPrimaryColor,
        elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                "Reset Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              Text(
                  "Enter your email adress below and we'll send you a link to reset your password"),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      width: 2,
                      color: AppColor.buttonColor,
                    ),
                  ),
                  labelText: "E-Mail",
                  hintText: "Type your E-mail",
                  suffixIcon: IconTheme(
                      data: IconThemeData(color: AppColor.buttonColor),
                      child: Icon(
                        Icons.email,
                      )),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: AppColor.buttonColor,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 8.0,
                    primary: AppColor.buttonColor,

                    minimumSize: Size.fromHeight(
                        50), // fromHeight use double.infinity as width and 40 is the height
                  ),
                  onPressed: () {},
                  child: Text(
                    "Send",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
