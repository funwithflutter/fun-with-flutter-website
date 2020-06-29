import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/application/blog/blog_bloc.dart';

import '../../application/page/page_bloc.dart';
import '../../infrastructure/core/urls.dart' as url;
import '../common/adaptive_scaffold.dart';
import '../components/accent_button.dart';
import '../utils/custom_icons_icons.dart';
import '../utils/url_handler.dart';
import 'components/app_page.dart';

@immutable
class _AppDesitination {
  final AdaptiveScaffoldDestination destination;
  final PageState page;

  const _AppDesitination({
    @required this.destination,
    @required this.page,
  });
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex;

  List<_AppDesitination> get _destinations => const [
        _AppDesitination(
          destination: AdaptiveScaffoldDestination(
            title: 'YouTube Videos',
            icon: CustomIcons.youtube,
          ),
          page: PageState.home,
        ),
        _AppDesitination(
          destination: AdaptiveScaffoldDestination(
            title: 'Blog Posts',
            icon: Icons.description,
          ),
          page: PageState.blog,
        ),
        _AppDesitination(
          destination: AdaptiveScaffoldDestination(
            title: 'Courses',
            icon: Icons.school,
          ),
          page: PageState.packages,
        ),
        _AppDesitination(
          destination: AdaptiveScaffoldDestination(
            title: 'Tags',
            icon: Icons.label,
          ),
          page: PageState.packages,
        ),
        _AppDesitination(
          destination: AdaptiveScaffoldDestination(
            title: 'Contact Us',
            icon: Icons.contact_phone,
          ),
          page: PageState.about,
        ),
      ];

  void _onNavigation(
    int index,
  ) {
    setState(() {
      _currentIndex = index;
    });
    BlocProvider.of<PageBloc>(context).add(
      PageEvent.update(_destinations[index].page),
    );
  }

  void _homePressed() {
    setState(() {
      _currentIndex = null;
    });
    BlocProvider.of<PageBloc>(context).add(
      const PageEvent.update(PageState.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      currentIndex: _currentIndex,
      destinations: _destinations.map((e) => e.destination).toList(),
      onNavigationIndexChange: (index) {
        _onNavigation(index);
      },
      homePressed: _homePressed,
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: _SubscribeButton(),
        ),
        _BrightnessButton(),
        _MoreButton()
      ],
      body: const AppPage(),
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
        print('more pressed');
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
          onPressed: () {
            launchURL(url.funWithYouTubeSubscribeUrl);
          },
        ),
      ),
    );
  }
}
