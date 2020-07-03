import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF284B63);
  // TODO these two are not used
  // static const Color secondaryColor = Color.fromRGBO(1, 87, 155, 1);
  // static const Color secondaryColor = Colors.yellow;
  static const Color accentColor = Color(0xFFFF6B6B);

  static const Color surfaceColor = Color(0xFFF2F2F2);
  static const Color backgroundColor = Color(0xFFFAFAFA);

  static const Color errorColor = Color(0xFFe63946);

  static const double fontSizeMedium = 14;

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      accentColor: accentColor,
      errorColor: errorColor,
      colorScheme: ThemeData.dark().colorScheme.copyWith(
            secondary: surfaceColor,
          ),
      navigationRailTheme: const NavigationRailThemeData(
        selectedIconTheme: IconThemeData(color: accentColor),
        unselectedIconTheme: IconThemeData(color: Colors.black54),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: accentColor),
        unselectedIconTheme: IconThemeData(
          color: surfaceColor,
        ),
      ),
      primaryIconTheme: const IconThemeData(
        size: 30,
        color: surfaceColor,
      ),
      iconTheme: const IconThemeData(
        size: 30,
        color: surfaceColor,
      ),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: primaryColor,
      accentColor: accentColor,
      dividerColor: accentColor,
      errorColor: errorColor,
      colorScheme: ThemeData.light().colorScheme.copyWith(
            primary: primaryColor,
            secondary: Colors.black54,
            surface: surfaceColor,
            onSurface: surfaceColor,
          ),
      navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: surfaceColor,
        selectedIconTheme: IconThemeData(color: accentColor),
        unselectedIconTheme: IconThemeData(color: Colors.black54),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: accentColor),
        unselectedIconTheme: IconThemeData(
          color: Colors.black54,
        ),
        backgroundColor: surfaceColor,
      ),
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
