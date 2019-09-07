import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF005699);
  static const Color accentColor = Colors.pink;
  static const Color fadedBlack = Color.fromRGBO(32, 33, 36, 100);

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
      primaryColor: Colors.green,
      accentColor: accentColor,
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
      dividerColor: accentColor,
      textTheme: const TextTheme(
          display1: TextStyle(
            fontSize: 28,
            fontFamily: fontFamilyWorkSans,
          ),
          title: TextStyle(
            fontSize: 16,
          ),
          body1: TextStyle(
            fontSize: 16,
          ),
          body2: TextStyle(
            fontSize: 16,
          ),
          button: TextStyle(
            fontSize: 16,
          )),
      fontFamily: fontFamilyDefault,
      hoverColor: accentColor,
      accentIconTheme: const IconThemeData(color: Colors.pink, size: 30),
      primaryIconTheme: const IconThemeData(color: Colors.pink, size: 30),
      iconTheme: const IconThemeData(color: Colors.pink, size: 30),
    );
  }
}
