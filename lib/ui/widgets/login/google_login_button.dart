import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/login/bloc.dart';
import 'package:fun_with_flutter/themes.dart';
import 'package:fun_with_flutter/utils/custom_icons_icons.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        BlocProvider.of<LoginBloc>(context).add(
          LoginWithGooglePressed(),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Icon(CustomIcons.google),
          SizedBox(width: 8,),
          Text('LOGIN WITH GOOGLE'),
        ],
      ),
      highlightedBorderColor: AppTheme.accentColor,
      hoverColor: AppTheme.accentColor,
      splashColor: AppTheme.primaryColor,
      color: Colors.redAccent,
    );
  }
}