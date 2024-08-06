import 'package:flutter/material.dart';
import 'package:introvertish/Custom_widgets/primary_button.dart';
import 'package:introvertish/styles.dart';

class ClearChatHistory extends StatelessWidget {
  const ClearChatHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //Icon(Icons.arrow_back),
        title: Text(
          "Clear Chat History",
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Deleting you chat's will",
              style: TextStyles.title1,
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Text("1. Delete all your individual chat and group messages"),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "2. Delete all your individual chat and group sent and received media messages"),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            PrimaryButton(
              title: 'Delete',
              onPressed: () {
                _showBottomSheet(context);
              },
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 36),
                Text(
                  'Are you sure you want to proceed to delete',
                  style: TextStyles.title1,
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    "Delete Everything",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  )),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
