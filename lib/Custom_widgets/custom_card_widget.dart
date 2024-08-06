import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  const CustomCard({
    Key? key,
    required this.text,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    double sHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(text, style: TextStyle(fontSize: 16)),
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
