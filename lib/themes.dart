import 'package:flutter/material.dart';

final ThemeData theme1 = ThemeData(
  primaryColor: Color(0xff43F7C5),
  fontFamily: 'Lato',
  scaffoldBackgroundColor: Color(0xffE8FFFA),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xff07A87B),
  ),
);

final ThemeData theme2 = ThemeData.dark().copyWith(
  primaryColor: Colors.grey,
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
  scaffoldBackgroundColor: Color(0xff11212D),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xffCCD0CF),
  ),
);

final ThemeData theme3 = ThemeData(
  primaryColor: Color(0xff43F7C5),
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'FastHand',
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
  scaffoldBackgroundColor: Color(0xff0a3244),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xfff9af29),
  ),
);
