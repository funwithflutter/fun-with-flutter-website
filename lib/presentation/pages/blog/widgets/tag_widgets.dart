import 'package:flutter/material.dart';

import '../../../core/themes.dart';

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
      return AppTheme.accentColor;
    }
    return AppTheme.primaryColor;
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
    List<BoxShadow> shadow;
    final translate = Matrix4.identity();
    if (tagConfig.isSelected) {
      translate.translate(0, -5);
      shadow = [
        const BoxShadow(
          color: Colors.black26,
          spreadRadius: 3,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ];
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          onTap(tagConfig.tag);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(8),
          transform: translate,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: shadow,
            color: tagConfig.getColor,
          ),
          height: tagConfig.height,
          child: Text(
            tagConfig.tag,
            style: TextStyle(fontSize: tagConfig.fontSize, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
