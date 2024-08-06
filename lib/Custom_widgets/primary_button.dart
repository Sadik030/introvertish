import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  PrimaryButton({super.key, required this.title, required this.onPressed,required this.color});
  String title;
  final VoidCallback onPressed;
  Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
