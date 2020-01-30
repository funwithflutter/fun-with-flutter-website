import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:fun_with_flutter/ui/components/icon_bar.dart';
import 'package:fun_with_flutter/ui/pages/about/data/data.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(32),
        constraints: const BoxConstraints(maxWidth: 1200, minWidth: 300),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wrap(
                alignment: WrapAlignment.start,
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
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional
                          .topStart // or Alignment.topLeft
                      ),
                ],
              ),
              const SizedBox(height: 16),
              Text(aboutIntro),
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Fun with  ',
                    style: Theme.of(context).textTheme.display1.copyWith(
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
                      textAlign: TextAlign.start,
                      alignment:
                          AlignmentDirectional.topStart // or Alignment.topLeft
                      ),
                ],
              ),
              const IconBar(),
              const SizedBox(height: 16),
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

// Todo(gordon): make this a stateless widget class
Widget _text(String text) {
  return Container(
    child: Text(
      text,
      // style: const TextStyle(fontSize: 18, color: AppTheme.fadedBlack),
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
        // color: AppTheme.primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
