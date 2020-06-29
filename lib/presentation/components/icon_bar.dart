import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

import '../../infrastructure/core/urls.dart' as url;
import '../core/themes.dart';
import '../utils/custom_icons_icons.dart';

class IconBar extends StatelessWidget {
  const IconBar({
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
  static const Color _stationaryColor = AppTheme.primaryColor;
  static const Color _hoverColor = AppTheme.accentColor;
  Color _color = _stationaryColor;

  void _onTap() {
    // UrlUtils.open(widget.url);
    html.window.open(widget.url, null);
  }

  void _changeButtonColor(Color color) {
    setState(() {
      _color = color;
    });
  }

  void _onPointerEnter(PointerEnterEvent event) {
    _changeButtonColor(_hoverColor);
  }

  void _onPointerExit(PointerExitEvent event) {
    _changeButtonColor(_stationaryColor);
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
            color: _color,
            size: 32,
          ),
        ),
      ),
    );
  }
}
