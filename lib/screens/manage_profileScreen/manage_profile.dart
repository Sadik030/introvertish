import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introvertish/Custom_widgets/custom_card_widget.dart';
import 'package:introvertish/constants/strings.dart';
import 'package:introvertish/screens/manage_profileScreen/Sub-Settings_Screen/notification_settings.dart';
import 'package:introvertish/screens/manage_profileScreen/Sub-Settings_Screen/payment_settings_screen.dart';
import 'package:introvertish/screens/manage_profileScreen/sections/account%20setting/account_setting.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Sub-Settings_Screen/appearance_screen.dart';

class ManageProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(232, 255, 250, 1),
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Icon(
                Icons.arrow_back_sharp,
                size: 30,
                color: Colors.black, // Adjust color as needed
              ),
              SizedBox(
                  width: 8), // Add some space between the icon and the text
              Text(
                "Settings",
                style: TextStyle(
                  color: Colors.black, // Adjust color as needed
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: sHeight * 0.02,
              ),
              SizedBox(
                width: double.infinity,
                height: sHeight * 0.08,
                child: Card(
                  elevation: 0,
                  color: Color.fromRGBO(232, 255, 250, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  child: GestureDetector(
                    onTap: () => print("Hello"),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/ScreenImages/prooo.png",
                          width: 50,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Lora Mertinez",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("9946239020",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          width: sWidth * 0.26,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 64),
                          child: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sHeight * 0.02,
              ),
              CustomCard(
                text: "Account",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AccountScreen()));
                },
                icon: Icons.account_circle_outlined,
              ),
              CustomCard(
                  text: "Notification",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationSettings()));
                  },
                  icon: Icons.notification_important_outlined),
              CustomCard(
                text: "Appearance",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppearanceScreen()));
                },
                icon: Icons.access_time,
              ),
              // CustomCard(text: "Chats",onPressed: (){},),
              CustomCard(
                text: "Payments",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentSettingsScreen()));
                },
                icon: Icons.payment,
              ),
              CustomCard(
                text: "Privacy Policy",
                onPressed: () {
                  _launchInBrowser(Uri.parse(privacypolicy));
                },
                icon: Icons.privacy_tip_outlined,
              ),

              // CustomCard(text: "Logout",onPressed: (){},),
              // Expanded(
              //   child: Container(),
              // ),

              // Button at the end of the column
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    width: 100,
                    height: 50,
                    //decoration: BoxDecoration(border: Border.all()),
                    child: Center(
                        child: Text(
                      'Logout',
                      style: TextStyle(color: Colors.red, fontSize: 19),
                    ))),
              ),
            ],
          ),
        ));
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}

//
