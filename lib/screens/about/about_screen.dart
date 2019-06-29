import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/screens/about/data/data.dart';
import 'package:fun_with_flutter/themes/app_colors.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Fun with  ',
                    style: Theme.of(context).textTheme.display1.copyWith(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                  ),
                  RotateAnimatedTextKit(
                      onTap: () {},
                      text: const [
                        'Flutter',
                        'Tutorials',
                        'Challenges',
                        'Resources',
                        'Code',
                        'UI',
                        'Animation',
                      ],
                      textStyle: const TextStyle(
                        fontSize: 40,
                        color: primaryColor,
                        fontFamily: 'PermanentMarker'
                      ),
                      textAlign: TextAlign.start,
                      alignment:
                          AlignmentDirectional.topStart // or Alignment.topLeft
                      ),
                ],
              ),
              _text(aboutIntro),
              _paragraphBreak(),
              _text(aboutPurpose0),
              const _BulletPoint(text: aboutPurpose1),
              const _BulletPoint(text: aboutPurpose2),
              _paragraphBreak(),
              _text(aboutGoal),
              _paragraphBreak(),
              _text(aboutLimitations),
              _paragraphBreak(),
              _text(aboutConclussion),
              _paragraphBreak(),
              _text('- Gordon')
            ],
          ),
        ),
      ),
    );
  }
}

Widget _text(String text) {
  return Container(
    child: Text(
      text,
      style: const TextStyle(fontSize: 22, color: fadedBlack),
    ),
  );
}

Widget _paragraphBreak() {
  return _text('\n');
}

class _BulletPoint extends StatelessWidget {
  const _BulletPoint({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const _Bullet(),
        const SizedBox(
          width: 10,
        ),
        Expanded(child: _text(text)),
      ],
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet({Key key, this.size = 5}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        color: primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
