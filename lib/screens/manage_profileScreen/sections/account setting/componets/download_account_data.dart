import 'package:flutter/material.dart';
import 'package:introvertish/styles.dart';

class DownloadAccountData extends StatelessWidget {
  const DownloadAccountData({super.key});

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
          "Your Account Data",
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your Account Data",
              style: TextStyles.title1,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                "Download and export a report of your account data. This report does not include any message or media"),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.grey),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Export as Text",
                      style: TextStyles.title1,
                    ),
                    Text(
                      "Easy to read text file",
                      style: TextStyles.title2,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.grey),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Export as Text",
                      style: TextStyles.title1,
                    ),
                    Text(
                      "Easy to read text file",
                      style: TextStyles.title2,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                  child: Text(
                "Export",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
