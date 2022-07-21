import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: 10,right: 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:50),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                       GestureDetector(
                          onTap: () {
                            
                          },
                          child: Icon(Icons.arrow_back)),
                           SizedBox(width:20),
                      Text('Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                SizedBox(height:20),
                Center(child: Text('Pial',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                 SizedBox(height:10),
                Center(
                  child: Container(
                    height: 120,
                    child: FittedBox(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/blood.png'),
                        radius: 120,
                      ),
                    ),
                  ),
                ),
                SizedBox(height:10),
      
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        
                      }, 
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF660000)
                      ),
                      child: Text('Donate Today')
                      ),
                       ElevatedButton(
                      onPressed: () {
                        
                      }, 
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.edit),
                          SizedBox(width: 5,),
                          Text('Edit Profile'),
                        ],
                      )
                      )
                  ],
                ),
                SizedBox(height:20),
                Line(),
                SizedBox(height:20),
                Padding(
                  padding:  EdgeInsets.only(left:10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Blood Info "),
                      SizedBox(height:10),
                      ListOfProfile(
                        images: 'assets/images/blood.png',
                        title: 'B +',
                        subtitle: 'Blood Group',
                      ),
                       SizedBox(height:20),
                      ListOfProfile(
                        images: 'assets/images/blood.png',
                        title: 'Fresher',
                        subtitle: 'Last Donation',
                      )
                    ],
                  ),
                ),
                 SizedBox(height:20),
                Line(),
                SizedBox(height:20),
                Padding(
                  padding:  EdgeInsets.only(left:10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Basic info"),
                      SizedBox(height:10),
                      ListOfProfile(
                        images: 'assets/icons/profile_icon.png',
                        title: 'Pial',
                        subtitle: 'Name',
                      ),                    
                    ],
                  ),
                ),
                 SizedBox(height:20),
                Line(),
                 SizedBox(height:20),
                Padding(
                  padding:  EdgeInsets.only(left:10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Contact Info "),
                      SizedBox(height:10),
                      ListOfProfile(
                        images: 'assets/icons/icons8-phone-32.png',
                        title: '01741070153',
                        subtitle: 'Mobile',
                      ),
                       SizedBox(height:20),
                      ListOfProfile(
                        images: 'assets/icons/icons8-mail-24.png',
                        title: 'ziauddinpial01@gmail.com',
                        subtitle: 'Email',
                      )
                    ],
                  ),
                ),
                 SizedBox(height:20),
                Line(),
                 SizedBox(height:20),
                  Padding(
                  padding:  EdgeInsets.only(left:10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Location Info "),
                      SizedBox(height:10),
                      ListOfProfile(
                        images: 'assets/icons/icons8-location-24.png',
                        title: 'Brahmanbaria', 
                        subtitle: 'Upazila',
                      ),
                       SizedBox(height:20),
                      ListOfProfile(
                        images: 'assets/icons/icons8-location-24.png',
                        title: 'Brahmanbaria',
                        subtitle: 'District',
                      ),
                       SizedBox(height:20),
                    ],
                  ),
                ),
      
      
            ],
          ),
        ),
      ),
    );
  }
}

class ListOfProfile extends StatelessWidget {
  const ListOfProfile({
    Key? key, required this.title, required this.subtitle,  this.images,
  }) : super(key: key);
  final String title,subtitle; 
  final String? images;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
              height: 50,
              width: 50,              
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.3),
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(image: AssetImage(images!))
              ),
        // FittedBox(
        //          alignment: Alignment.center,
        // clipBehavior: Clip.none,
        //         child: Image.asset(images!,fit: BoxFit.fill,),
        //       ),
            ),
        SizedBox(width:20),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            SizedBox(height:10),
            Text(subtitle,style: TextStyle(fontSize: 12),),
          ],
        )
      ],
    );
  }
}



class Line extends StatelessWidget {
  const Line({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 6,
    width: double.infinity,
    color: Colors.grey.withOpacity(0.3));
  }
}
