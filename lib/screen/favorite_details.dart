import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => FavoriteScreenState();
}

class FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Favorite Screen"),),
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: _height,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.green.shade100,
              shadowColor: Colors.red.shade100,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name: "),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.delete_outline_outlined))
                      ],
                    ),
                    Text("Email: "),
                    Text("Phone Number: "),
                    Text("Current Upazila: ")
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
