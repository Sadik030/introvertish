import 'package:flutter/material.dart';
import 'package:introvertish/screens/ChatWindowScreen/SubScreens/chat_window_screen.dart';
import 'package:introvertish/screens/ChatWindowScreen/create_chat.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<ChatItems> _chats = [
    ChatItems(
      profileImagePath: 'assets/ScreenImages/userImage.png',
      userName: "User1",
      message: "message sent by user1",
      userType: "singleuser",
    ),
    ChatItems(
      profileImagePath: 'assets/ScreenImages/userImage.png',
      userName: "User2",
      message: "message sent by user2",
      userType: "singleuser",
    ),
    ChatItems(
      profileImagePath: 'assets/ScreenImages/userImage.png',
      userName: "User3",
      message: "how are you ?",
      userType: "singleuser",
    ),
    ChatItems(
      profileImagePath: 'assets/ScreenImages/group.jpg',
      userName: "Group1",
      message: "Recent message in group",
      userType: "group",
    ),
    ChatItems(
      profileImagePath: 'assets/ScreenImages/group.jpg',
      userName: "Group2",
      message: "Recent message in group",
      userType: "group",
    )
  ];

  List<ChatItems> _filteredChats = [];

  @override
  void initState() {
    _filteredChats = _chats;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    setState(() {
      _filteredChats = _chats
          .where((chat) => chat.userName
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chats",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateChat()));
              },
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.blueAccent,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(width: 1, color: Colors.red)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(width: 1, color: Colors.grey))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _filteredChats.length,
                  itemBuilder: (context, index) {
                    final chat = _filteredChats[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(chat.profileImagePath),
                      ),
                      title: Text(
                        chat.userName,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(chat.message),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatWindowScreen(
                                      profilePhoto: chat.profileImagePath,
                                      userName: chat.userName,
                                      userType: chat.userType,
                                    )));
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ChatItems {
  final String profileImagePath;
  final String userName;
  final String message;
  final String userType;

  ChatItems({
    required this.profileImagePath,
    required this.userName,
    required this.message,
    required this.userType,
  });
}
