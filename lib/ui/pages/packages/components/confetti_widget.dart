import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiExample extends StatefulWidget {
  const ConfettiExample({Key key}) : super(key: key);

  @override
  _ConfettiExampleState createState() => _ConfettiExampleState();
}

class _ConfettiExampleState extends State<ConfettiExample> {
  ConfettiController controller;

  @override
  void initState() {
    controller = ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: ConfettiWidget(
            confettiController: controller,
            blastDirection: -pi/2,
            numberOfParticles: 20,
          ),
          
        ),
        FlatButton(
          child: const Text('Make it rain'),
          onPressed: () {
            controller.play();
          },
        )
      ],
    );
  }
}
