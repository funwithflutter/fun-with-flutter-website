import 'package:flutter/material.dart';

import '../../../themes.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: _onPressed,
      highlightedBorderColor: AppTheme.primaryColor,
      splashColor: AppTheme.primaryColor,
      hoverColor: AppTheme.accentColor,
      child: const Text('REGISTER'),
    );
  }
}
