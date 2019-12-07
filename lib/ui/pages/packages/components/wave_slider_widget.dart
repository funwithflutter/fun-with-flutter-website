import 'package:flutter/material.dart';
import 'package:wave_slider/wave_slider.dart';

class WaveSliderExample extends StatefulWidget {
  @override
  _WaveSliderExampleState createState() => _WaveSliderExampleState();
}

class _WaveSliderExampleState extends State<WaveSliderExample> {
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
