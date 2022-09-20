import 'package:flutter/material.dart';

class Style {
  static const Color primary = Color.fromRGBO(54, 54, 54, 1);
  static const Color secondary = Color.fromRGBO(185, 185, 197, 1);
  static const Color background = Color.fromRGBO(247, 248, 251, 1);

  static const MaterialColor blue = MaterialColor(_bluePrimaryValue, {
    50: Color(0xFFEAF4FF),
    100: Color(0xFFCCE4FF),
    200: Color(0xFFAAD3FF),
    300: Color(0xFF87C1FF),
    400: Color(0xFF6EB3FF),
    500: Color(_bluePrimaryValue),
    600: Color(0xFF4D9EFF),
    700: Color(0xFF4395FF),
    800: Color(0xFF3A8BFF),
    900: Color(0xFF297BFF),
  });
  static const int _bluePrimaryValue = 0xFF54A6FF;

  static const MaterialColor blueAccent = MaterialColor(_blueAccentValue, {
    100: Color(0xFFFFFFFF),
    200: Color(_blueAccentValue),
    400: Color(0xFFD6E5FF),
    700: Color(0xFFBDD4FF),
  });
  static const int _blueAccentValue = 0xFFFFFFFF;
}
