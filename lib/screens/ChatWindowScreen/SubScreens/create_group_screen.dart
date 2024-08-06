import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List _items = [];
  List _filteredItems = [];
  int? _selectedIndex;
  Map<String, dynamic>? _selectedItem;
  List<int> _selectedIndices = [];

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
    double sWidth = MediaQuery.of(context).size.width;
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
        title: Text(
          "New Group",
          style: TextStyle(),
        ),
        leadingWidth: 100,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Create",
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Group camera
          Container(
            margin: EdgeInsets.only(left: sWidth * 0.06, right: sWidth * 0.06),
            width: sWidth * 0.95,
            height: sHeight * 0.1,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors
                          .black, // You can change the color of the border here
                      width: 1.0, // You can adjust the width of the border here
                    ),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 50,
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Group name"),
                    SizedBox(
                      height: sHeight * 0.01,
                    ),
                    SizedBox(
                      width: sWidth * 0.7,
                      height: sHeight * 0.045,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          //Selcted contacts
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: SizedBox(
              height: sHeight * 0.06,
              width: sWidth * 0.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _selectedIndices.length,
                itemBuilder: (context, index) {
                  int selectedIndex = _selectedIndices[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      child: Image.asset(
                          _filteredItems[selectedIndex]["profileImage"]),
                    ),
                  );
                },
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0,
                  key: ValueKey(_filteredItems[index]["id"]),
                  margin: const EdgeInsets.all(20),
                  child: CheckboxListTile(
                    value: _selectedIndices.contains(index),
                    onChanged: (bool? checked) {
                      setState(() {
                        if (checked!) {
                          _selectedIndices.add(index); // Add the selected index
                        } else {
                          _selectedIndices
                              .remove(index); // Remove the deselected index
                        }
                      });
                    },
                    title: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Text(_filteredItems[index]["name"]),
                    ),
                    secondary: CircleAvatar(
                      backgroundImage:
                          AssetImage(_filteredItems[index]["profileImage"]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
