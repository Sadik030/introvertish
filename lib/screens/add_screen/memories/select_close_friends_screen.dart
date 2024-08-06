import 'package:flutter/material.dart';

class SelectCloseFriendsScreen extends StatefulWidget {
  const SelectCloseFriendsScreen({super.key});

  @override
  State<SelectCloseFriendsScreen> createState() =>
      _SelectCloseFriendsScreenState();
}

enum CloseFriends { LoraMartinez, JohnDoe }

class _SelectCloseFriendsScreenState extends State<SelectCloseFriendsScreen> {
  Map<String, bool> _selectedFriends = {
    'Lora Martinez': false,
    'John Doe': false,
    'Jane Smith': false,
    'Alice Johnson': false,
  };

  void goToAddCaptionScreen() {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Close Friends',
                        style: TextStyle(
                          fontFamily: 'NunitoSans',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Recommended',
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16.0),
              ..._selectedFriends.keys.map((String friend) {
                return CheckboxListTile(
                  title: Text(friend),
                  value: _selectedFriends[friend],
                  onChanged: (bool? value) {
                    setState(() {
                      _selectedFriends[friend] = value!;
                    });
                  },
                );
              }),
              SizedBox(
                width: double.infinity,
                height: 48.0,
                child: ElevatedButton(
                  onPressed: goToAddCaptionScreen,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF01C28C),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'NunitoSans',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
