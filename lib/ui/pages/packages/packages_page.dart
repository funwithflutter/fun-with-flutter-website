import 'package:flutter/material.dart';
import 'package:fun_with_flutter/themes.dart';
import 'package:fun_with_flutter/ui/components/link.dart';
import 'package:fun_with_flutter/ui/pages/packages/components/splash_tap_widget.dart';
import 'package:fun_with_flutter/ui/pages/packages/components/wave_slider_widget.dart';
import 'package:fun_with_flutter/utils/urls.dart' as url;

class PackagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text('Custom Widgets',
                style: Theme.of(context).textTheme.display1),
          ),
          _CustomWidget(
            title: 'Splash Tap',
            child: SplashTapWidget(),
            pubUrl: url.splashTapPackage.pubUrl,
            youtubeUrl: url.splashTapPackage.youtubeUrl,
          ),
          _CustomWidget(
            title: 'Wave Slider',
            child: WaveSliderWidget(),
            pubUrl: url.waveSliderPackage.pubUrl,
            youtubeUrl: url.waveSliderPackage.youtubeUrl,
          ),
          _CustomWidget(
            title: 'Confetti',
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'The package is not currently working on Flutter Web. Check out the repository and the video instead.',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppTheme.fadedBlackColor,
                  ),
                ),
              ),
            ),
            pubUrl: url.confettiPackage.pubUrl,
            youtubeUrl: url.confettiPackage.youtubeUrl,
          ),
        ],
      ),
    );
  }
}

class _CustomWidget extends StatelessWidget {
  const _CustomWidget(
      {Key key,
      @required this.title,
      this.pubUrl,
      this.youtubeUrl,
      @required this.child})
      : super(key: key);

  final String title;
  final String pubUrl;
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
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 0.5,
                ),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
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
                        child: Text(title,
                            style: Theme.of(context).textTheme.headline),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Link(title: 'Package', url: pubUrl),
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
