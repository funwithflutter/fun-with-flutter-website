import 'package:flutter/material.dart';

class NoticeMeAnimation extends AnimatedWidget {
  const NoticeMeAnimation({
    Key key,
    Animation<double> scale,
    this.child,
  }) : super(
          key: key,
          listenable: scale,
        );
  Animation<double> get _scale => listenable;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10 * _scale.value),
      child: SizedBox(
        width: 100,
        height: 80,
        child: Center(child: child),
      ),
    );
  }
}