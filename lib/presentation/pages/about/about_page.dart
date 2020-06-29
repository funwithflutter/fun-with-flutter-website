import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../components/info_bar.dart';
import 'data/data.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800, minWidth: 300),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Wrap(
              children: <Widget>[
                RotateAnimatedTextKit(
                  onTap: () {},
                  text: const [
                    'FLUTTER',
                    'TUTORIALS',
                    'CHALLENGES',
                    'RESOURCES',
                    'CODE',
                    'UI',
                    'ANIMATION',
                  ],
                  textStyle: const TextStyle(
                      fontSize: 40, fontFamily: 'DMSerifDisplay'),
                ),
                Container(
                  color: Colors.grey[200],
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      _Text(aboutIntro),
                      _Text(aboutGoal),
                      _Text(aboutConclussion),
                      _Text('- Gordon'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const InfoBar(),
          ],
        ),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text(
    this.text, {
    Key key,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16),
    );
  }
}
