import 'package:flutter/material.dart';
import 'package:introvertish/screens/friends_screen/Subscreen/group_screen.dart';

class FriendsScreen extends StatefulWidget {
  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  List<bool> isSelected = [false, false];
  String message = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Friends")),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildSearchField(),
            SizedBox(height: screenHeight * 0.05),
            _buildButtons(),
            SizedBox(height: 20),
            Container(
              height: screenHeight * 0.045,
              child: ToggleButtons(
                renderBorder: true,
                splashColor: Colors.grey.withOpacity(0.5),
                color: Colors.black,
                selectedColor: Colors.white,
                fillColor: Colors.grey.shade400,
                borderWidth: 1.5,
                selectedBorderColor: Colors.grey,
                borderRadius: BorderRadius.circular(50),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Contacts',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Groups',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
                isSelected: isSelected,
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < isSelected.length;
                        buttonIndex++) {
                      isSelected[buttonIndex] = (buttonIndex == index);
                    }
                    message = index == 0 ? 'Hello Contacts' : 'Hello Groups';
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            _buildListItems(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(
              Icons.mic,
              size: 35,
            ),
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5))),
      ),
    );
  }

  Widget _buildButtons() {
    void _InviteFreindsOverlay() {
      showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.8,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(0))),
                            onPressed: () {},
                            child: Text("Email"))),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(0))),
                            onPressed: () {},
                            child: Text("SMS"))),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(0))),
                            onPressed: () {},
                            child: Text("Share link"))),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.06,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.grey, width: 1))),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("New Group"),
                Icon(Icons.people_alt_rounded, color: Colors.black),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.06,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.grey, width: 1))),
            onPressed: _InviteFreindsOverlay,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Invite Friends"),
                Icon(Icons.email_outlined, color: Colors.black),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListItems() {
    if (isSelected[0]) {
      // Render items for Contacts
      return Column(
        children: [
          _buildListItem(
            heading: "Contact 1",
            subheading: "Contact details",
            onTap: () {
              // Handle tap for contact item
            },
          ),
          _buildListItem(
            heading: "Contact 2",
            subheading: "Contact details",
            onTap: () {
              // Handle tap for contact item
            },
          ),
        ],
      );
    } else {
      // Render items for Groups
      return Column(
        children: [
          _buildListItem(
            heading: "Group 1",
            subheading: "Group details",
            onTap: () {
              // Handle tap for group item
            },
          ),
          _buildListItem(
            heading: "Group 2",
            subheading: "Group details",
            onTap: () {
              // Handle tap for group item
            },
          ),
        ],
      );
    }
  }

  Widget _buildListItem(
      {required String heading,
      required String subheading,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(heading,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    )),
                Text(subheading,
                    style: TextStyle(
                      fontSize: 14,
                    )),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
