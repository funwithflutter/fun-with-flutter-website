import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/screens/custom_widgets/splash_tap/splash.dart';
import 'package:fun_with_flutter/themes/app_colors.dart';

class SplashTapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Splash(
      onTap: () {},
      splashColor: fadedBlack,
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
