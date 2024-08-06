import 'package:flutter/material.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight); // You can adjust the height if needed
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(

      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.grey.shade100,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: CircleAvatar(
          radius: 100,
          child: ClipOval(
            child: Image.asset(
              "assets/ScreenImages/Logo.jpg",
              fit: BoxFit.cover, // Ensure the image covers the entire circular area
            ),
          ),
        ),
      ),

      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.timer),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications),
        ),
      ],
    );
  }
}