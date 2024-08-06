import 'package:flutter/material.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String profileImagePath;
  final String username;
  ChatDetailsScreen(
      {required this.profileImagePath, required this.username, super.key});

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //user name and Icon Button
              Container(
                width: sWidth * 0.9,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.profileImagePath),
                      radius:
                          50, // Set your desired radius for the profile image
                    ),
                    const SizedBox(
                        height:
                            20), // Add some space between the profile image and username
                    Text(
                      widget.username,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.volume_mute_rounded,
                                  size: 50,
                                )),
                            Text("Mute"),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.person,
                                  size: 50,
                                )),
                            Text("Profile")
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete_rounded,
                                  size: 50,
                                )),
                            Text("Delete all chat"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.01 * sHeight,
              ),
              GroupsInCommon(),
              SizedBox(
                height: 0.01 * sHeight,
              ),
              Spacer(),
              SizedBox(
                width: sWidth * 0.8,
                height: sHeight * 0.07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {},
                  child:
                      Text("Block User", style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ));
  }
}

class GroupsInCommon extends StatelessWidget {
  final List<String> commonGroups = [
    'Group 1',
    'Group 2',
    'Group 3',
    'Group 4',
    'Group 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Groups in Common',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: commonGroups.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(commonGroups[index]),
                onTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
