import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/screens/custom_widgets/wave_slider/wave_slider.dart';

class WaveSliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: WaveSlider(
        onChanged: (value) {},
      ),
    );
  }
}
