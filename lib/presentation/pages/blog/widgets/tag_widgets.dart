import 'package:flutter/material.dart';

class TagConfiguartion {
  final String tag;
  final double height;
  final double fontSize;
  final bool isSelected;
  final Color color = Colors.red[500];

  TagConfiguartion._(this.tag, this.height, this.fontSize, this.isSelected);

  TagConfiguartion.bigTag(String tag, {bool isSelected = false})
      : this._(tag, 40, 18, isSelected);
  TagConfiguartion.smallTag(String tag, {bool isSelected = false})
      : this._(tag, 30, 12, isSelected);

  Color get getColor {
    if (!isSelected) {
      return color.withAlpha(180);
    }
    return color;
  }
}

typedef OnTagTap = void Function(String tag);

class TagWidget extends StatelessWidget {
  const TagWidget({
    Key key,
    @required this.tagConfig,
    @required this.onTap,
  }) : super(key: key);

  final TagConfiguartion tagConfig;
  final OnTagTap onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(tagConfig.tag);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: tagConfig.getColor,
        ),
        height: tagConfig.height,
        child:
            Text(tagConfig.tag, style: TextStyle(fontSize: tagConfig.fontSize)),
      ),
    );
  }
}
