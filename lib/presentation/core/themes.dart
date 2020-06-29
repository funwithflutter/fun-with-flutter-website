import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // static const Color primaryColor = Color.fromRGBO(84, 197, 248, 1);284B63
  static const Color primaryColor = Color(0xFF284B63);
  static const Color secondaryColor = Color.fromRGBO(1, 87, 155, 1);
  static const Color accentColor = Color(0xFFFF6B6B);
  static const Color surfaceColor = Color(0xFFF2F2F2);
  static const Color backgroundColor = Color(0xFFFAFAFA);

  static const Color alternateColor = Color.fromRGBO(255, 224, 116, 1);
  static const Color fadedBlackColor = Color.fromRGBO(32, 33, 36, 1);
  static const Color errorColor = Color(0xFFe63946);

  static const fontFamilyWorkSans = 'WorkSans';
  static const fontFamilyOpenSans = 'OpenSans';
  static const fontFamilyDefault = fontFamilyOpenSans;

  static const fontWeightExtraLight = FontWeight.w200;
  static const fontWeightLight = FontWeight.w300;
  static const fontWeightNormal = FontWeight.w400;
  static const fontWeightMedium = FontWeight.w500;
  static const fontWeightSemiBold = FontWeight.w600;
  static const fontWeightBold = FontWeight.w700;

  static const double fontSizeMedium = 14;

  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: primaryColor,
      accentColor: accentColor,
      buttonTheme: const ButtonThemeData(),
      dividerColor: accentColor,
      errorColor: errorColor,
      backgroundColor: Colors.pink,
      colorScheme: ThemeData.light().colorScheme.copyWith(
            primary: primaryColor,
            secondary: secondaryColor,
            surface: surfaceColor,
            onSurface: surfaceColor,
          ),

      // fontFamily: fontFamilyDefault,
      // textTheme: GoogleFonts.firaCodeTextTheme(
      //   ThemeData.light().textTheme,
      // ),
      // ThemeData.light()
      //     .copyWith()
      //     .textTheme
      //     .apply(fontFamily: GoogleFonts.sourceSansPro()
      // accentIconTheme: const IconThemeData(
      //   color: accentColor,
      //   size: 30,
      // ),
      primaryIconTheme: const IconThemeData(
        color: primaryColor,
        size: 30,
      ),
      iconTheme: const IconThemeData(
        color: primaryColor,
        size: 30,
      ),
    );
  }
}
