import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Custom_widgets/custom_card_widget.dart';
import '../../../constants/strings.dart';
import '../CustomWidgets/recent_activity.dart';

class PaymentSettingsScreen extends StatefulWidget {
  const PaymentSettingsScreen({super.key});

  @override
  State<PaymentSettingsScreen> createState() => _PaymentSettingsScreenState();
}

class _PaymentSettingsScreenState extends State<PaymentSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Payments",
          style: TextStyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Settings",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Lato",
                      fontSize: 18),
                ),
                SizedBox(
                  height: sHeight * 0.01,
                ),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: SizedBox(
                    height: sHeight * 0.045,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Payment Method",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.blueAccent,
                            ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: sHeight * 0.01,
                ),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: InkWell(
                    onTap: () {
                      _launchInBrowser(Uri.parse(privacypolicy));
                    },
                    child: SizedBox(
                      height: sHeight * 0.045,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Help and Support",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: sHeight * 0.03,
            ),
            Text(
              "Recent Activity",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Lato",
                  fontSize: 17),
            ),
            SizedBox(
              height: sHeight * 0.01,
            ),
            RecentActivityWidget(
              sHeight: sHeight, // Example height
              title: "Hour Extension",
              rateText: "\$1/3hr",
            ),
            SizedBox(
              height: sHeight * 0.01,
            ),
            RecentActivityWidget(
              sHeight: sHeight, // Example height
              title: "Theme Purchase",
              rateText: "\$5",
            )
          ],
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
