import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introvertish/styles.dart';

class Autodownload extends StatelessWidget {
  const Autodownload({super.key});

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
          "Auto Download",
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Auto Download Option",
              style: TextStyles.title1,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _showBottomSheet(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey,
                      width: 2), // Customize border color and width as needed
                  borderRadius: BorderRadius.circular(
                      0), // Customize border radius as needed
                ),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Photos",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _showBottomSheet(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide.none, // No border on top
                    vertical: BorderSide(
                      color: Colors.grey, // Customize border color
                      width: 2.0, // Customize border width
                    ),
                  ),
                  borderRadius: BorderRadius.circular(
                      0), // Customize border radius as needed
                ),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Video",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey,
                    width: 2), // Customize border color and width as needed
                borderRadius: BorderRadius.circular(
                    0), // Customize border radius as needed
              ),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Reset Settings",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 36),
                Text(
                  "Auto download",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                Text(
                  "Never",
                  style: TextStyles.title1,
                ),
                Divider(
                  thickness: 1,
                  color: Color.fromARGB(255, 103, 99, 99),
                ),
                Text(
                  "Wifi",
                  style: TextStyles.title1,
                ),
                Divider(
                  thickness: 1,
                  color: Color.fromARGB(255, 103, 99, 99),
                ),
                Text(
                  "Cellular ",
                  style: TextStyles.title1,
                ),
                Divider(
                  thickness: 1,
                  color: Color.fromARGB(255, 103, 99, 99),
                ),
                Text(
                  "Wifi & Cellular",
                  style: TextStyles.title1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
