import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/screens/custom_widgets/splash_tap/splash.dart';

class SplashTapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Splash(
      onTap: (){},
      child: Container(
        width: 300 ,
        height: 300,
        color: Colors.pink,
      ),
    );
  }
}