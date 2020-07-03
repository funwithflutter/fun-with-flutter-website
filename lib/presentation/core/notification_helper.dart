import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'themes.dart';

class NotificationHelper {
  static Flushbar error({
    @required String message,
    String title,
    Duration duration = const Duration(seconds: 3),
    bool isPhone = false,
  }) {
    return Flushbar<dynamic>(
      title: title,
      message: message,
      duration: duration,
      maxWidth: isPhone ? null : 300,
      flushbarPosition:
          isPhone ? FlushbarPosition.BOTTOM : FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      icon: const Icon(
        Icons.warning,
        size: 28.0,
        color: AppTheme.errorColor,
      ),
    );
  }

  static Flushbar success({
    @required String message,
    String title,
    Duration duration = const Duration(seconds: 3),
    bool isPhone = false,
  }) {
    return Flushbar<dynamic>(
      title: title,
      message: message,
      duration: duration,
      maxWidth: isPhone ? null : 300,
      flushbarPosition:
          isPhone ? FlushbarPosition.BOTTOM : FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
      icon: Icon(
        Icons.check_circle,
        color: Colors.green[300],
      ),
    );
  }
}
