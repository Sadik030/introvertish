import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:introvertish/screens/home_screen/home_page.dart';
import 'package:introvertish/screens/manage_profileScreen/manage_profile.dart';
import 'package:introvertish/screens/manage_profileScreen/sections/account%20setting/account_setting.dart';
import 'package:introvertish/themes.dart';
import 'package:provider/provider.dart';
import 'Homepage/myhome_page.dart';
import 'OnBoardingScreen/welcome_screen.dart';
import 'Providers/theme_provider.dart';
import 'providers/mobile_number_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(theme1),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      navigatorObservers: [MyNavigatorObserver()],
      routes: {
        '/home': (context) => SimpleBottomNavigation(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Introvertish.life',
      theme: themeProvider.themeData,
      home: WelcomeScreen(),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    if (previousRoute?.settings.name == '/otp') {
      // Navigate to SimpleBottomNavigation index 0 screen
      Navigator.of(route.navigator!.context).pushNamed('/bottom_navigation');
    }
  }
}
