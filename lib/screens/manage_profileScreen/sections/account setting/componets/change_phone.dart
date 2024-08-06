import 'package:flutter/material.dart';
import 'package:introvertish/screens/manage_profileScreen/CustomWidgets/titleTextfield_container.dart';
import 'package:introvertish/styles.dart';

class ChangePhone extends StatelessWidget {
  const ChangePhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Change Phone",
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Old Phone Number",
              style: TextStyles.title1,
            ),
            SizedBox(
              height: 20,
            ),
            TitleTextfildContainer(title: "Country Code"),
            SizedBox(
              height: 10,
            ),
            TitleTextfildContainer(title: "Phone Number"),
            SizedBox(
              height: 20,
            ),
            Text("Your New Phone Number", style: TextStyles.title1),
            SizedBox(
              height: 20,
            ),
            TitleTextfildContainer(title: "Country Code"),
            SizedBox(
              height: 10,
            ),
            TitleTextfildContainer(title: "Phone Number"),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: ElevatedButton(onPressed: () {}, child: Text("Change")),
            )
          ],
        ),
      ),
    );
  }
}
