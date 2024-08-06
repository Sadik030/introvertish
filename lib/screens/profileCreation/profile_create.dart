import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import '../home_screen/home_page.dart';

class ProfileCreation extends StatefulWidget {
  const ProfileCreation({super.key});

  @override
  State<ProfileCreation> createState() => _ProfileCreationState();
}

class _ProfileCreationState extends State<ProfileCreation> {
  TextEditingController IFullname = TextEditingController();
  TextEditingController IEmail = TextEditingController();
  TextEditingController IPhone = TextEditingController();
  TextEditingController IDOB = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(Ips),
          actions: <Widget>[
            TextButton(
              onPressed: () => _saveProfile(),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/ScreenImages/userImage.png"),
                      radius: 40,
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                //Full name Textfield
                TextField(
                  controller: IFullname,
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(Icons.person),
                        onPressed: () {},
                      ),
                      labelText: Ifullname,
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amberAccent, width: 3),
                        borderRadius: BorderRadius.circular(11),
                      )),
                ),

                SizedBox(
                  height: 0.02 * screenHeight,
                ),

                //Email Textfield
                TextField(
                  controller: IEmail,
                  decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: IconButton(
                        icon: Icon(Icons.email),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amberAccent, width: 3),
                        borderRadius: BorderRadius.circular(11),
                      )),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),

                //Phone TextField
                TextField(
                  keyboardType: TextInputType.number,
                  controller: IPhone,
                  decoration: InputDecoration(
                      labelText: "Phone",
                      prefixIcon: IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () {},
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amberAccent, width: 3),
                        borderRadius: BorderRadius.circular(11),
                      )),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),

                //Bio TextField
                TextField(
                  decoration: InputDecoration(
                      labelText: Ibio,
                      hintText: Ibio,
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amberAccent, width: 3),
                        borderRadius: BorderRadius.circular(11),
                      )),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),

                //Date of birth TextField
                TextField(
                  controller: IDOB,
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(Icons.cake_rounded),
                        onPressed: () {},
                      ),
                      labelText: "DOB",
                      hintText: Idob,
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amberAccent, width: 3),
                        borderRadius: BorderRadius.circular(11),
                      )),
                ),
              ],
            ),
          ),
        ));
  }

  void _saveProfile() {
    // Here you can add your logic to save the profile data
    Navigator.push(context, MaterialPageRoute(builder: (context)=> SimpleBottomNavigation() ));
    // Show snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile updated successfully!'),
        backgroundColor: Colors.lightGreen.shade500,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
