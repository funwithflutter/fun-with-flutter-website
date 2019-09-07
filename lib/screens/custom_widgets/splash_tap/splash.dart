import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  /// Creates a splash effect onTap, surrounding its [child] widget.
  ///
  /// The [child] parameter can not be null.
  /// The tap is disabled if the [onTap] parameter is null.
  const Splash({
    Key key,
    @required this.onTap,
    @required this.child,
    this.splashColor,
    this.minRadius = defaultMinRadius,
    this.maxRadius = defaultMaxRadius,
  })  : assert(minRadius != null),
        assert(maxRadius != null),
        assert(minRadius > 0),
        assert(minRadius < maxRadius),
        super(key: key);

  /// Child widget. Could be anything that should be surrounded by the splash.
  ///
  /// The bigger the child the bigger the splash effect - which is constrained
  /// by the [minRadius] and [maxRadius]
  final Widget child;

  /// [onTap] method, should not be null or empty.
  final GestureTapCallback onTap;

  /// The color of the splash effect. The default [splashColor] is black.
  final Color splashColor;

  /// The minimum radius of the splash effect.
  /// Should be set if the [child] widget is very small to create a
  /// more desired effect.
  ///
  /// The default minimum radius is set to [defaultMinRadius]
  final double minRadius;

  /// The maximum radius of the splash effect.
  /// Regardless of how big the child widget is, the splash will not extend
  /// the [maxRadius]. Should be set if a larger splash effect is desired.
  ///
  /// The default maximum radius is set to [defaultMaxRadius]
  final double maxRadius;

  static const double defaultMinRadius = 50;
  static const double defaultMaxRadius = 120;

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Tween<double> radiusTween;
  Tween<double> borderWidthTween;
  Animation<double> radiusAnimation;
  Animation<double> borderWidthAnimation;
  AnimationStatus status;
  Offset _tapPosition;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((AnimationStatus listener) {
            status = listener;
          });
    radiusTween = Tween<double>(begin: 0, end: 50);
    radiusAnimation = radiusTween
        .animate(CurvedAnimation(curve: Curves.ease, parent: controller));
    borderWidthTween = Tween<double>(begin: 25, end: 1);
    borderWidthAnimation = borderWidthTween.animate(
        CurvedAnimation(curve: Curves.fastOutSlowIn, parent: controller));

    super.initState();
  }

  void _animate() {
    controller.forward(from: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// Buttons are disabled by default. To enable a button, set its [onTap]
  /// property to a non-null value.
  bool get _enabled => widget.onTap != null;

  void _handleTap(TapUpDetails tapDetails) {
    if (!_enabled) {
      return;
    }
    final RenderBox renderBox = context.findRenderObject();
    _tapPosition = renderBox.globalToLocal(tapDetails.globalPosition);
    final double radius = (renderBox.size.width > renderBox.size.height)
        ? renderBox.size.width
        : renderBox.size.height;

    double constraintRadius;
    if (radius > widget.maxRadius) {
      constraintRadius = widget.maxRadius;
    } else if (radius < widget.minRadius) {
      constraintRadius = widget.minRadius;
    } else {
      constraintRadius = radius;
    }

    radiusTween.end = constraintRadius * 0.6;
    borderWidthTween.begin = radiusTween.end / 2;
    borderWidthTween.end = radiusTween.end * 0.01;
    _animate();

    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _SplashPaint(
        radius: radiusAnimation.value,
        borderWidth: borderWidthAnimation.value,
        status: status,
        tapPosition: _tapPosition,
        color: widget.splashColor ?? Colors.black,
      ),
      child: GestureDetector(
        child: widget.child,
        onTapUp: _handleTap,
      ),
    );
  }
}

class _SplashPaint extends CustomPainter {
  _SplashPaint({
    @required this.radius,
    @required this.borderWidth,
    @required this.status,
    @required this.tapPosition,
    @required this.color,
  }) : blackPaint = Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = borderWidth;

  final double radius;
  final double borderWidth;
  final AnimationStatus status;
  final Offset tapPosition;
  final Color color;
  final Paint blackPaint;

  @override
  void paint(Canvas canvas, Size size) {
    if (status == AnimationStatus.forward) {
      canvas.drawCircle(tapPosition, radius, blackPaint);
    }
  }

  @override
  bool shouldRepaint(_SplashPaint oldDelegate) {
    if (radius != oldDelegate.radius) {
      return true;
    } else {
      return false;
    }
  }
}
