import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/components/link.dart';
import 'package:fun_with_flutter/screens/custom_widgets/components/splash_tap_widget.dart';
import 'package:fun_with_flutter/screens/custom_widgets/components/wave_slider_widget.dart';
import 'package:fun_with_flutter/themes.dart';

class CustomWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text('Custom Widgets',
                  style: Theme.of(context).textTheme.display1
                  // .copyWith(color: AppTheme.fadedBlack),
                  ),
            ),
            _CustomWidget(
              title: 'Splash Tap',
              child: SplashTapWidget(),
              packageUrl: 'https://pub.dev/packages/splash_tap',
              youtubeUrl: 'https://www.youtube.com/watch?v=7qkhpeZdD7U',
            ),
            _CustomWidget(
              title: 'Wave Slider',
              child: WaveSliderWidget(),
              packageUrl: 'https://pub.dev/packages/wave_slider',
              youtubeUrl:
                  'https://www.youtube.com/playlist?list=PLjr4ufdmNA4J2-KwMutexAjjf_VmjL1eH',
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
    return LimitedBox(
      maxHeight: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  // color: AppTheme.fadedBlack,
                  width: 0.5,
                ),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        // color: AppTheme.fadedBlack,
                        width: 0.5,
                      ),
                    ),
                  ),
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .headline
                              // .copyWith(color: AppTheme.fadedBlack),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Link(title: 'Package', url: packageUrl),
                      Link(
                        title: 'Video',
                        url: youtubeUrl,
                      ),
                    ],
                  ),
                ),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
