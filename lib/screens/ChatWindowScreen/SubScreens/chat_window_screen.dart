import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:introvertish/screens/ChatWindowScreen/SubScreens/chat_details_screen.dart';
import 'package:introvertish/screens/ChatWindowScreen/SubScreens/group_details_screen.dart';

class ChatWindowScreen extends StatefulWidget {
  final String profilePhoto;
  final String userName;
  final String userType;

  ChatWindowScreen({required this.profilePhoto, required this.userName,required this.userType});

  @override
  _ChatWindowScreenState createState() => _ChatWindowScreenState();
}

class _ChatWindowScreenState extends State<ChatWindowScreen> {
  List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _simulateChat();
  }

  void _simulateChat() async {
    String dummyJson = '''
    [
      {"text": "Hi, how are you?", "isSentByUser": false},
      {"text": "I'm good, thank you!", "isSentByUser": true},
      {"text": "That's great to hear!", "isSentByUser": false},
      {"text": "How about you?", "isSentByUser": false},
      {"text": "I'm doing well too!", "isSentByUser": true}
    ]
    ''';

    List<dynamic> parsedJson = json.decode(dummyJson);

    setState(() {
      _messages = parsedJson
          .map((message) => ChatMessage(
                text: message['text'],
                isSentByUser: message['isSentByUser'],
              ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            if (widget.userType == 'singleuser') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailsScreen(
                    profileImagePath: widget.profilePhoto,
                    username: widget.userName,
                  ),
                ),
              );
            } else if (widget.userType == 'group') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GroupDetailsScreen(profileImagePath: widget.profilePhoto, username: widget.userName)
                ),
              );
            }
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.profilePhoto),
              ),
              SizedBox(width: 10),
              Text(widget.userName),
            ],
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: _messages[index].isSentByUser
                          ? Colors.blue.withOpacity(0.1)
                          : Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(_messages[index].text),
                  ),
                  trailing:
                      _messages[index].isSentByUser ? null : Icon(Icons.person),
                  leading: !_messages[index].isSentByUser
                      ? null
                      : Icon(Icons.person),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isSentByUser;

  ChatMessage({required this.text, required this.isSentByUser});
}
