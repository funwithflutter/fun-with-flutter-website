import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/components/markdown/flutter_markdown.dart';

// const String aboutIntro = '''
//   Welcome!
//   Everything you see was made entirely in Flutter!
//   I'm hoping to expand this more as time goes on and as the Flutter Web project matures.
//   You might see issues while browsing the site. These might be because I screwed up, or it might be a Flutter for web issue.
//   At the time of writing this, the framework is still in technical preview. There's also a lot to be left desired....
// ''';

Widget aboutIntro() {
  return Column(
    children: <Widget>[
      header1('Welcome!'),
      body1('Everything you see was made entirely in Flutter!'),
      paragraph([
        "I want to expand this more as time goes on and as the Flutter Web project matures. At the time of writing this it is still with Technical Preview",
        "You might see issues while browsing the site. These might be because I screwed up, or it might be a Flutter for Web issue :)"
      ], [true,false])
    ],
  );
}
