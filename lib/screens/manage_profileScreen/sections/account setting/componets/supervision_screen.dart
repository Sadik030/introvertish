import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introvertish/constants/space.dart';
import 'package:introvertish/screens/manage_profileScreen/CustomWidgets/supervison_card.dart';
import 'package:introvertish/screens/manage_profileScreen/sections/account%20setting/componets/add_supervision_account.dart';
import 'package:introvertish/styles.dart';

class Supervision extends StatelessWidget {
  const Supervision({super.key});

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
          "Supervision",
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Accounts under my supervision"),
                vSpavce(),
                SupervisionCard(),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddSupervisionAccount()));
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    "Add Account",
                    style: TextStyles.title1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
