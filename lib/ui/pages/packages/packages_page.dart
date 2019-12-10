import 'package:flutter/material.dart';
import 'package:fun_with_flutter/ui/components/link.dart';
import 'package:fun_with_flutter/ui/pages/packages/components/splash_tap_widget.dart';
import 'package:fun_with_flutter/ui/pages/packages/components/wave_slider_widget.dart';
import 'package:fun_with_flutter/utils/urls.dart' as url;

import 'components/confetti_widget.dart';

class PackagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
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
            _ExampleWidget(
              title: 'Confetti',
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: ConfettiExample(),
              ),
              pubUrl: url.confettiPackage.pubUrl,
              youtubeUrl: url.confettiPackage.youtubeUrl,
            ),
            _ExampleWidget(
              title: 'Splash Tap',
              child: SplashTapExample(),
              pubUrl: url.splashTapPackage.pubUrl,
              youtubeUrl: url.splashTapPackage.youtubeUrl,
            ),
            _ExampleWidget(
              title: 'Wave Slider',
              child: WaveSliderExample(),
              pubUrl: url.waveSliderPackage.pubUrl,
              youtubeUrl: url.waveSliderPackage.youtubeUrl,
            ),
          ],
        ),
      ),
    );
  }
}

class _ExampleWidget extends StatelessWidget {
  const _ExampleWidget(
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
