import 'package:flutter/material.dart';

class GroupDetailsScreen extends StatefulWidget {
  final String profileImagePath;
  final String username;
  GroupDetailsScreen(
      {required this.profileImagePath, required this.username, super.key});

  @override
  State<GroupDetailsScreen> createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends State<GroupDetailsScreen> {
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
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.volume_down_alt,
                                    size: 50,
                                  )),
                              Text(
                                "Mute",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.exit_to_app,
                                    size: 50,
                                  )),
                              Text(
                                "Exit Group",
                                style: TextStyle(fontSize: 12),
                              )
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
                              Text(
                                "Delete all your \nchats",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.02 * sHeight,
              ),
              MembersInCommon(),
              SizedBox(
                height: 0.01 * sHeight,
              ),
              Spacer(),
            ],
          ),
        ));
  }
}

class MembersInCommon extends StatelessWidget {
  final List<String> commonMembers = [
    'Member 1',
    'Member 2',
    'Member 3',
    'Member 4',
    'Member 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Members',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: commonMembers.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(commonMembers[index]),
                onTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
