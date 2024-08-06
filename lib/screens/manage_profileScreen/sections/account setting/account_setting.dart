import 'package:flutter/material.dart';
import 'package:introvertish/Custom_widgets/text_contianer_widget.dart';
import 'package:introvertish/constants/space.dart';
import 'package:introvertish/screens/manage_profileScreen/sections/account%20setting/componets/download_account_data.dart';
import 'package:introvertish/screens/manage_profileScreen/sections/account%20setting/componets/delete_account.dart';
import 'package:introvertish/screens/manage_profileScreen/sections/account%20setting/componets/clear_chat_history.dart';
import 'package:introvertish/screens/manage_profileScreen/sections/account%20setting/componets/supervision_screen.dart';
import 'package:introvertish/screens/manage_profileScreen/sections/account%20setting/componets/change_phone.dart';
import 'package:introvertish/screens/manage_profileScreen/sections/account%20setting/componets/time_spent.dart';
import 'package:introvertish/screens/manage_profileScreen/sections/account%20setting/componets/update_pin.dart';

import 'componets/auto_download.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(232, 255, 250, 1),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          //Icon(Icons.arrow_back),
          title: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Account Settings",
              style: TextStyle(),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                    ),
                  ),
                ),
                TextContainer(
                  title: "Change Your PIN",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdatePin()),
                    );
                  },
                  icon: Icons.privacy_tip_outlined,
                ),
                vSpavce(),
                TextContainer(
                  title: "Advanced PIN setting",
                  onPressed: () {},
                  icon: Icons.settings,
                ),
                vSpavce(),
                TextContainer(
                  title: "Change Your Phone Number",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePhone()),
                    );
                  },
                  icon: Icons.call,
                ),
                vSpavce(),
                TextContainer(
                  title: "Supervision",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Supervision()));
                  },
                  icon: Icons.supervised_user_circle,
                ),
                vSpavce(),
                TextContainer(
                  title: "Time Spent",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TimeSpent()),
                    );
                  },
                  icon: Icons.timelapse,
                ),
                vSpavce(),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Privacy",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: sWidth,
                  // decoration: BoxDecoration(border: Border.all()),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Pause Your Account",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        Switch(
                          onChanged: toggle,
                          value: ispause,
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                vSpavce(),
                TextContainer(
                  title: "Delete Account",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DeleteAccount()),
                    );
                  },
                  icon: Icons.delete,
                ),
                vSpavce(),
                TextContainer(
                  title: "Download Your Account Data",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DownloadAccountData()),
                    );
                  },
                  icon: Icons.data_array,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Chats",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                    ),
                  ),
                ),
                TextContainer(
                  title: "Clear Chat history",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ClearChatHistory()),
                    );
                  },
                  icon: Icons.cleaning_services,
                ),
                vSpavce(),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Data Usage",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                    ),
                  ),
                ),
                TextContainer(
                  title: "Auto Download",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Autodownload()),
                    );
                  },
                  icon: Icons.download_outlined,
                ),
                vSpavce(),
                Container(
                  height: 40,
                  width: sWidth,
                  //decoration: BoxDecoration(border: Border.all()),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Auto Play Video",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Switch(
                          onChanged: toggleSwitch,
                          value: isautoplay,
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
              ],
            ),
          ),
        ));
  }

  bool isautoplay = false;
  bool ispause = false;
  void toggle(bool value) {
    setState(() {
      ispause = value;
      if (ispause) {
        _showPopUp('Account Paused');
      } else {
        _showPopUp('Account Resumed');
      }
    });
  }

  void toggleSwitch(bool value) {
    setState(() {
      isautoplay = value;
      if (isautoplay) {
        _showPopUp('Enabled Auto Play');
      } else {
        _showPopUp('Disable  Auto Play');
      }
    });
  }

  // Function to show pop-up
  Future<void> _showPopUp(String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text(message),
          content: Text(
            message,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
