import 'package:flutter/material.dart';

import '../../../constants/strings.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
  bool button4 = false;
  bool button5 = false;
  bool button6 = false;
  bool button7 = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification ",
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(
            screenWidth * 0.05), // Adjust padding based on screen width
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "In App Notification",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth *
                      0.05, // Adjust font size based on screen width
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors
                        .grey), // Customize border color and width as needed
                borderRadius: BorderRadius.circular(
                    10), // Customize border radius as needed
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: Text(IApp1),
                    value: button1,
                    onChanged: (bool value) {
                      setState(() {
                        button1 = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text(IApp2),
                    value: button2,
                    onChanged: (bool value) {
                      setState(() {
                        button2 = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text(IApp3),
                    value: button3,
                    onChanged: (bool value) {
                      setState(() {
                        button3 = value;
                      });
                    },
                  ),

                  // Adjust spacing based on screen height
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email Notification",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth *
                      0.05, // Adjust font size based on screen width
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors
                        .grey), // Customize border color and width as needed
                borderRadius: BorderRadius.circular(
                    10), // Customize border radius as needed
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: Text(IEmail1),
                    value: button4,
                    onChanged: (bool value) {
                      setState(() {
                        button4 = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text(IEmail2),
                    value: button5,
                    onChanged: (bool value) {
                      setState(() {
                        button5 = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text(IEmail3),
                    value: button6,
                    onChanged: (bool value) {
                      setState(() {
                        button6 = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text(IEmail4),
                    value: button7,
                    onChanged: (bool value) {
                      setState(() {
                        button7 = value;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
