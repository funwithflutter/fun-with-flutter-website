import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/screens/custom_widgets/components/splash_tap_widget.dart';
import 'package:fun_with_flutter/screens/custom_widgets/components/wave_slider_widget.dart';
import 'package:fun_with_flutter/themes/app_colors.dart';

class CustomWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: _CustomWidget(
                title: 'Splash Tap',
                child: SplashTapWidget(),
              ),
            ),
            Expanded(
              child: _CustomWidget(
                title: 'Wave Slider',
                child: WaveSliderWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomWidget extends StatelessWidget {
  const _CustomWidget(
      {Key key,
      @required this.title,
      this.packageUrl,
      this.youtubeUrl,
      @required this.child})
      : super(key: key);

  final String title;
  final String packageUrl;
  final String youtubeUrl;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
          color: fadedBlack,
          width: 2,
        )),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: fadedBlack,
                    width: 2,
                  ),
                ),
              ),
              width: double.infinity,
              height: 50,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title,
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .copyWith(color: fadedBlack)),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  const _Link(title: 'Package'),
                  const _Link(title: 'Video'),
                ],
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _Link extends StatelessWidget {
  const _Link({Key key, @required this.title, this.url}) : super(key: key);

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(title),
    );
  }
}
