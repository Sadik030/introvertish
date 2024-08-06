import 'package:flutter/material.dart';

class vSpavce extends StatelessWidget {
  const vSpavce({super.key});

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: sHeight * 0.01,
    );
  }
}
