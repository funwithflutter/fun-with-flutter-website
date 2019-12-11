import 'package:flutter/material.dart';
import 'package:fun_with_flutter/ui/widgets/support_the_channel/notice_me_animation.dart';
import 'package:fun_with_flutter/ui/widgets/support_the_channel/thank_you.dart';

class TheWallButton extends StatefulWidget {
  const TheWallButton({Key key, this.callback}) : super(key: key);

  final VoidCallback callback;

  @override
  _TheWallButtonState createState() =>
      _TheWallButtonState();
}

class _TheWallButtonState extends State<TheWallButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOut,
          reverseCurve: Curves.easeIn),
    );
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() { 
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.callback();
      },
      child: MouseRegion(
        onEnter: (event) {
          _controller.stop();
        },
        onExit: (event) {
          _controller.repeat(reverse: true);
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: NoticeMeAnimation(
            scale: _scaleAnimation,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: const <Widget>[
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'The Wall!',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}