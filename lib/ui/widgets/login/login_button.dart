import 'package:flutter/material.dart';

import '../../../themes.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  final VoidCallback _onPressed;


  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: _onPressed,
      highlightedBorderColor: AppTheme.primaryColor,
      hoverColor: AppTheme.primaryColor,
      splashColor: AppTheme.accentColor,
      child: const Text('LOGIN'),
    );
  }
}