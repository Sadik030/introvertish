import 'package:flutter/material.dart';
import 'package:introvertish/styles.dart';

// ignore: must_be_immutable
class TitleTextfildContainer extends StatelessWidget {
  TitleTextfildContainer({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyles.body1),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
              //hintText: 'Enter text',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}
