import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../components/icon_bar.dart';
import 'data/data.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(32),
        constraints: const BoxConstraints(maxWidth: 1200, minWidth: 300),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  Text(
                    'Fun with  ',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.black,
                          fontSize: 36,
                        ),
                  ),
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
                          fontSize: 40,
                          // color: AppTheme.primaryColor,
                          fontFamily: 'DMSerifDisplay'),
                      alignment: AlignmentDirectional
                          .topStart // or Alignment.topLeft
                      ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(aboutIntro),
              _paragraphBreak(),
              // _text(aboutPurpose0),
              // const _BulletPoint(text: aboutPurpose1),
              // const _BulletPoint(text: aboutPurpose2),
              // _paragraphBreak(),
              _text(aboutGoal),
              // _paragraphBreak(),
              // _text(aboutLimitations),
              _paragraphBreak(),
              _text(aboutConclussion),
              _paragraphBreak(),
              _text('- Gordon'),
              _paragraphBreak(),
              const IconBar(),

            ],
          ),
        ),
      ),
    );
  }
}

// Todo(gordon): make this a stateless widget class
Widget _text(String text) {
  return Text(
    text,
    // style: const TextStyle(fontSize: 18, color: AppTheme.fadedBlack),
  );
}

Widget _paragraphBreak() {
  return _text('\n');
}