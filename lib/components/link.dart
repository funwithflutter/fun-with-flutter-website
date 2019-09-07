import 'package:flutter/material.dart';
import 'package:fun_with_flutter/plugins/url_launcher/url_launcher.dart';

class Link extends StatelessWidget {
  const Link(
      {Key key,
      @required this.title,
      @required this.url,
      this.name,
      this.padding = const EdgeInsets.all(8),
      this.textSize = 14})
      : super(key: key);

  final String title;
  final String url;
  final String name;
  final EdgeInsets padding;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: padding,
        child: Text(
          title,
          style: TextStyle(
            fontSize: textSize,
          ),
        ),
      ),
      onTap: () {
        UrlUtils.open(url);
      },
    );
  }
}
