import 'dart:ui';

import 'package:flutter/material.dart';

import '../common/adaptive_scaffold.dart';
import '../components/accent_button.dart';
import '../pages/home/home_page.dart';
import '../utils/custom_icons_icons.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      currentIndex: 0,
      destinations: const [
        AdaptiveScaffoldDestination(
          title: 'YouTube Videos',
          icon: CustomIcons.youtube,
        ),
        AdaptiveScaffoldDestination(
          title: 'Blog Posts',
          icon: Icons.description,
        ),
        AdaptiveScaffoldDestination(
          title: 'Courses',
          icon: Icons.school,
        ),
        AdaptiveScaffoldDestination(
          title: 'Tags',
          icon: Icons.label,
        ),
      ],
      onNavigationIndexChange: (index) {
        print('move to $index');
      },
      actions: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: _SubscribeButton(),
        ),
        const _BrightnessButton(),
        const _MoreButton()
      ],
      body: HomePage(),
    );
  }
}

class _MoreButton extends StatelessWidget {
  const _MoreButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {
        print('todo');
      },
    );
  }
}

class _BrightnessButton extends StatelessWidget {
  const _BrightnessButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.brightness_2),
      onPressed: () {
        print('switch brightness');
      },
    );
  }
}

class _SubscribeButton extends StatelessWidget {
  const _SubscribeButton({
    Key key,
  }) : super(key: key);

  static const Size _buttonSize = Size(168, 54);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: _buttonSize.width,
        height: _buttonSize.height,
        child: AccentButton(
          lable: 'Subscribe on YouTube',
          onPressed: () {},
        ),
      ),
    );
  }
}
