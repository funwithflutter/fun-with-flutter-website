import 'package:flutter/material.dart';
import 'package:splash_tap/splash_tap.dart';

import '../../../../themes.dart';

class SplashTapExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Splash(
      onTap: () {},
      splashColor: AppTheme.fadedBlackColor,
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text('Tap anywhere :)',
              style: Theme.of(context).textTheme.headline4),
        ),
      ),
    );
  }
}
