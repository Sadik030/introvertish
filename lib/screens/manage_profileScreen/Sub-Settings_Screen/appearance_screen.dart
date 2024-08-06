import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introvertish/Providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../themes.dart';

class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({super.key});

  @override
  State<AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    double sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Appearance",
          style: TextStyle(),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Theme",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            SizedBox(
              height: sHeight * 0.01,
            ),
            GestureDetector(
              onTap: () {
                themeProvider.setTheme(theme1);
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Theme 1",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Checkbox(
                        value: themeProvider.themeData == theme1,
                        onChanged: (value) {
                          if (value == true) themeProvider.setTheme(theme1);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                themeProvider.setTheme(theme2);
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Theme 2",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Checkbox(
                        value: themeProvider.themeData == theme2,
                        onChanged: (value) {
                          if (value == true) themeProvider.setTheme(theme2);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                themeProvider.setTheme(theme3);
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Theme 3",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Checkbox(
                        value: themeProvider.themeData == theme3,
                        onChanged: (value) {
                          if (value == true) themeProvider.setTheme(theme3);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: sHeight * 0.04,
            ),
            Text(
              "Premium",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            SizedBox(
              height: sHeight * 0.01,
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
                        "Theme1",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    CheckboxWidget(),
                  ],
                ),
              ),
            ),
            Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Theme2",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "buy \$2",
                          style: TextStyle(color: Colors.red),
                        ))
                  ],
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
                        "Theme3",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "buy \$2",
                          style: TextStyle(color: Colors.red),
                        ))

                    // CheckboxWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
