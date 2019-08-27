import 'package:flutter_web/material.dart';

class AppTheme {
  // static const Color primaryColor = Color(0xFF005699);
  // static const Color secondaryColor = Colors.white;
  // static const Color fadedBlack = Color.fromRGBO(32, 33, 36, 100);

  static const fontFamilyWorkSans = 'WorkSans';
  static const fontFamilyOpenSans = 'OpenSans';
  static const fontFamilyDefault = fontFamilyOpenSans;

  static const fontWeightExtraLight = FontWeight.w200;
  static const fontWeightLight = FontWeight.w300;
  static const fontWeightNormal = FontWeight.w400;
  static const fontWeightMedium = FontWeight.w500;
  static const fontWeightSemiBold = FontWeight.w600;
  static const fontWeightBold = FontWeight.w700;

  static ThemeData theme() {
    return ThemeData(
      primaryColor: Colors.blue,
      accentColor: Colors.red,
      textTheme: const TextTheme(
        display1: TextStyle(
          color: Colors.orange,
          fontSize: 28,
          fontFamily: fontFamilyWorkSans,
        ),
        title: TextStyle(
          fontSize: 14,
          color: Colors.purple
        ),
        body1: TextStyle(
          fontSize: 14,
          color: Colors.orange
        ),
        body2: TextStyle(
          fontSize: 14,
          color: Colors.orange
        ),
      ),
      fontFamily: fontFamilyDefault,
      hoverColor: Colors.green,
      iconTheme: const IconThemeData(
        color: Colors.pink
      ),
    );
  }
}
