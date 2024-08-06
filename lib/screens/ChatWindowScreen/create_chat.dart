import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introvertish/screens/ChatWindowScreen/SubScreens/chat_window_screen.dart';
import 'package:introvertish/screens/ChatWindowScreen/SubScreens/create_group_screen.dart';

class CreateChat extends StatefulWidget {
  const CreateChat({super.key});

  @override
  State<CreateChat> createState() => _CreateChatState();
}

class _CreateChatState extends State<CreateChat> {
  List _items = [];
  List _filteredItems = [];

  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/Json/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
      _filteredItems = _items;
    });
  }

  void _runFilter(String enteredKeyword) {
    List filteredList = _items.where((item) {
      return item["name"].toLowerCase().contains(enteredKeyword.toLowerCase());
    }).toList();

    setState(() {
      _filteredItems = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style:
                  TextStyle(fontSize: 17, color: Colors.grey.withOpacity(0.7)),
            ),
          ),
        ),
        title: Text("New Message"),
        leadingWidth: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Search box
            SizedBox(
              height: sHeight * 0.05,
              width: double.infinity,
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 1, color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: sHeight * 0.015,
            ),
            // Group button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: BorderSide(width: 1),
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateGroup()));
              },
              child: Row(children: [
                Icon(
                  Icons.people_alt_sharp,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  "New Group",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ]),
            ),

            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: sHeight * 0.01,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: _filteredItems.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatWindowScreen(
                                            profilePhoto: _filteredItems[index]
                                                ["profileImage"],
                                            userName: _filteredItems[index]
                                                ["name"],
                                        userType: _filteredItems[index]["userType"],
                                          )));
                            },
                            child: Card(
                              elevation: 0,
                              key: ValueKey(_filteredItems[index]["id"]),
                              margin: const EdgeInsets.all(20),
                              child: ListTile(
                                leading: CircleAvatar(
                                    child: Image.asset(
                                        _filteredItems[index]["profileImage"])),
                                contentPadding: EdgeInsets.only(left: 25),
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Text(_filteredItems[index]["name"]),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
