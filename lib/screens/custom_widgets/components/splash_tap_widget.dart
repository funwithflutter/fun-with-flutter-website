import 'package:flutter/material.dart';
import 'package:fun_with_flutter/screens/custom_widgets/splash_tap/splash.dart';
import 'package:fun_with_flutter/themes.dart';

class SplashTapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Splash(
      onTap: () {},
      // splashColor: AppTheme.fadedBlack,
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text('Tap anywhere :)',
              style: Theme.of(context).textTheme.display1),
        ),
      ),
    );
  }
}
