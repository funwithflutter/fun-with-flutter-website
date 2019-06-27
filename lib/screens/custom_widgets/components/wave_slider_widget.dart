import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/screens/custom_widgets/wave_slider/wave_slider.dart';
import 'package:fun_with_flutter/themes/app_colors.dart';

class WaveSliderWidget extends StatefulWidget {
  @override
  _WaveSliderWidgetState createState() => _WaveSliderWidgetState();
}

class _WaveSliderWidgetState extends State<WaveSliderWidget> {
  String display = 'Drag the slider';

  void _setDipslay(double value) {
    setState(() {
      display = 'Value: ${(value * 100).truncate()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            display,
            style: Theme.of(context).textTheme.display1,
          ),
          WaveSlider(
            color: fadedBlack,
            onChanged: (value) {
              _setDipslay(value);
            },
            onChangeEnd: (value) {
              _setDipslay(value);
            },
          ),
        ],
      ),
    );
  }
}
