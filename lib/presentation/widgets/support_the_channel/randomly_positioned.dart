import 'dart:math';

import 'package:flutter/material.dart';

class RandomlyPositionedWidget extends StatefulWidget {
  const RandomlyPositionedWidget({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _RandomlyPositionedWidgetState createState() =>
      _RandomlyPositionedWidgetState();
}

class _RandomlyPositionedWidgetState extends State<RandomlyPositionedWidget> {
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.7 * random.nextDouble(),
      top: MediaQuery.of(context).size.height * 0.3 * random.nextDouble(),
      child: widget.child,
    );
  }
}