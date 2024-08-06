import 'package:flutter/material.dart';

class RecentActivityWidget extends StatelessWidget {
  const RecentActivityWidget({
    Key? key,
    required this.sHeight,
    required this.title,
    required this.rateText,
  }) : super(key: key);

  final double sHeight;
  final String title;
  final String rateText;

  @override
  Widget build(BuildContext context) {
    TextStyle text15 = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: double.infinity,
            height: sHeight * 0.09,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: text15),
                      Text("Valid from 12/02/2024 12:10PM",
                          style: TextStyle(
                            fontSize: 12,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(rateText, style: text15),
                      Text("Valid till 1 week",
                          style: TextStyle(
                            fontSize: 12,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
