import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/screens/custom_widgets/components/splash_tap_widget.dart';
import 'package:fun_with_flutter/screens/custom_widgets/components/wave_slider_widget.dart';

class CustomWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WaveSliderWidget(),
        SplashTapWidget(),
      ],
    );
  }
}
