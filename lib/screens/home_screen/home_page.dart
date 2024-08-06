import 'package:flutter/material.dart';
import 'package:introvertish/screens/ChatWindowScreen/chats_screen.dart';
import 'package:introvertish/screens/add_screen/memories/add_memories_screen.dart';

import '../../constants/Colors/colors.dart';
import '../friends_screen/friend_screen.dart';
import '../manage_profileScreen/manage_profile.dart';
import 'HomemainScreen/homecontent_screen.dart';

class SimpleBottomNavigation extends StatefulWidget {
  const SimpleBottomNavigation({Key? key}) : super(key: key);

  @override
  State<SimpleBottomNavigation> createState() => _SimpleBottomNavigationState();
}

class _SimpleBottomNavigationState extends State<SimpleBottomNavigation> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    FriendsScreen(),
    AddMemoriesScreen(),
    ChatsScreen(),
    ManageProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: mint,
        unselectedItemColor: const Color(0xff757575),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: _navBarItems,
      ),
    );
  }
}

const _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home_rounded),
    label: '', // Empty string as label
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.people_alt_rounded),
    activeIcon: Icon(Icons.people_alt_rounded),
    label: '', // Empty string as label
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.add_circle_outline),
    activeIcon: Icon(Icons.add_circle_outline),
    label: '', // Empty string as label
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.chat_outlined),
    activeIcon: Icon(Icons.chat_outlined),
    label: '', // Empty string as label
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_rounded),
    activeIcon: Icon(Icons.person_rounded),
    label: '', // Empty string as label
  ),
];
