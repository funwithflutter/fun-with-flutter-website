import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/themes/app_colors.dart';

ThemeData theme = ThemeData(
  textTheme: textTheme,
  fontFamily: 'OpenSans',
    
);

TextTheme textTheme = TextTheme(
  display1: TextStyle(
    color: primaryColor,
    fontSize: 28,
    fontFamily: 'WorkSans'
  ),
  title: TextStyle(
    fontSize: 14,
  ),

);