import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/core/urls.dart' as url;
import '../core/utils/custom_icons_icons.dart';
import '../core/utils/url_handler.dart';

class InfoBar extends StatelessWidget {
  const InfoBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Made in '),
                  TextSpan(
                    text: 'Flutter',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchURL(url.flutterDev);
                      },
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  const TextSpan(text: ' by '),
                  TextSpan(
                    text: 'Gordon Hayes',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchURL(url.funWithTwitter);
                      },
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ],
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            const _IconBar(),
            Text('Copyright FunWithFlutter © 2020',
                style: Theme.of(context).textTheme.overline),
          ],
        ),
      ),
    );
  }
}

class SliverBottomInfoBar extends StatelessWidget {
  const SliverBottomInfoBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: InfoBar(),
      ),
    );
  }
}

class _IconBar extends StatelessWidget {
  const _IconBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: const [
        SizedBox(
          width: 16,
        ),
        _IconBarButton(
          iconData: CustomIcons.youtube,
          url: url.funWithYouTubeUrl,
        ),
        _IconBarButton(
          iconData: CustomIcons.githubCircled,
          url: url.funWithGithubUrl,
        ),
        _IconBarButton(
          iconData: CustomIcons.twitterSquared,
          url: url.funWithTwitter,
        ),
        // _IconBarButton(
        //   iconData: CustomIcons.coffee,
        //   url: url.funWithPatreon,
        // ),
      ],
    );
  }
}

class _IconBarButton extends StatefulWidget {
  const _IconBarButton({Key key, this.url, this.iconData}) : super(key: key);

  final String url;
  final IconData iconData;

  @override
  _IconBarButtonState createState() => _IconBarButtonState();
}

class _IconBarButtonState extends State<_IconBarButton> {
  // static const Color _stationaryColor = Colors.white;
  // static const Color _hoverColor = AppTheme.accentColor;
  // Color _color = _stationaryColor;
  bool _onHover = false;

  void _onTap() {
    launchURL(widget.url);
  }

  // void _changeButtonColor(Color color) {
  //   setState(() {
  //     _color = color;
  //   });
  // }

  void _onPointerEnter(PointerEnterEvent event) {
    // _changeButtonColor(_hoverColor);
    setState(() {
      _onHover = true;
    });
  }

  void _onPointerExit(PointerExitEvent event) {
    // _changeButtonColor(_stationaryColor);
    setState(() {
      _onHover = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onPointerEnter,
      onExit: _onPointerExit,
      child: GestureDetector(
        onTap: _onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            widget.iconData,
            color: _onHover ? Theme.of(context).accentColor : null,
            size: 32,
          ),
        ),
      ),
    );
  }
}
