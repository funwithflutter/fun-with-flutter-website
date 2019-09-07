import 'package:flutter/material.dart';
import 'package:wave_slider/wave_slider.dart';

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
            // color: AppTheme.fadedBlack,
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
