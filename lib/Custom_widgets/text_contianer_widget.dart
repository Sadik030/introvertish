import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextContainer extends StatelessWidget {
  TextContainer(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.icon});
  String title;
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    //double sHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title, style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: onPressed,
        ),
        Divider(
          color: Colors.grey,
          height: 1,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}
