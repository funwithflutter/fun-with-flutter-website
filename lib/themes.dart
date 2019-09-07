import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.black;
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

  static const double fontSizeMedium = 16;

  static ThemeData theme() {
    return ThemeData(
      primaryColor: primaryColor,
      accentColor: accentColor.withOpacity(0.8),
      buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.normal),
      dividerColor: accentColor,
      textTheme: const TextTheme(
          display1: TextStyle(
            fontSize: 28,
            fontFamily: fontFamilyWorkSans,
          ),
          title: TextStyle(
            fontSize: fontSizeMedium,
          ),
          body1: TextStyle(
            fontSize: fontSizeMedium,
          ),
          body2: TextStyle(
            fontSize: fontSizeMedium,
          ),
          button: TextStyle(
            fontSize: fontSizeMedium,
          )),
      fontFamily: fontFamilyDefault,
      accentIconTheme: const IconThemeData(
        color: accentColor,
        size: 30,
      ),
      primaryIconTheme: const IconThemeData(
        color: accentColor,
        size: 30,
      ),
      iconTheme: const IconThemeData(
        color: Colors.pink,
        size: 30,
      ),
    );
  }
}
