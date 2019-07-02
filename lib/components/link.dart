import 'dart:html' as html;
import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/themes/app_colors.dart';

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
        html.window.open(url, name);
      },
    );
  }
}
