import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:fun_with_flutter/plugins/url_launcher/url_launcher.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:fun_with_flutter/themes.dart';
import 'package:fun_with_flutter/utils/custom_icons_icons.dart';
import 'package:fun_with_flutter/utils/urls.dart' as url;

class IconBar extends StatelessWidget {
  const IconBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: <Widget>[
        const SizedBox(
          width: 16,
        ),
        _IconBarButton(
          iconData: CustomIcons.youtube,
          url: url.funWithYouTubeUrl,
        ),
        _IconBarButton(
          iconData: CustomIcons.github_circled,
          url: url.funWithGithubUrl,
        ),
        _IconBarButton(
          iconData: CustomIcons.twitter_squared,
          url: url.funWithTwitter,
        ),
        _IconBarButton(
          iconData: CustomIcons.coffee,
          url: url.funWithPatreon,
        ),
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
  static const Color _stationaryColor = AppTheme.accentColor;
  static const Color _hoverColor = AppTheme.primaryColor;
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
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              widget.iconData,
              color: _color,
              size: 64,
            ),
          ),
        ),
      ),
    );
  }
}
