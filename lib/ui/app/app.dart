import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fun_with_flutter/blocs/bloc.dart';
import 'package:fun_with_flutter/ui/app/components/app_page.dart';
import 'package:fun_with_flutter/ui/app/components/error_listener.dart';
import 'package:fun_with_flutter/ui/app/components/app_bar.dart';
import 'package:fun_with_flutter/ui/app/components/overlay_panel.dart';
import 'package:fun_with_flutter/ui/widgets/account/account.dart';
import 'package:fun_with_flutter/ui/widgets/menu_drawer/menu_drawer.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _menuAnimation;

  final Duration animationDuration = const Duration(milliseconds: 150);
  static const double _menuSize = 300;
  final Tween<double> _tween = Tween<double>()
    ..begin = 0
    ..end = _menuSize;

  bool _menuIsVisible = false;
  bool isSmallScreen = false;
  bool _accountPanelVisible = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: animationDuration);
    _menuAnimation = _tween
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.addStatusListener(_menuVisibilityStatusChange);

    super.initState();
  }

  void _menuVisibilityStatusChange(status) {
    if (status == AnimationStatus.forward) {
      setState(() {
        _menuIsVisible = true;
      });
    } else if (status == AnimationStatus.dismissed) {
      setState(() {
        _menuIsVisible = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setScreenSize(Size screenSize) {
    if (screenSize.width < 750) {
      setState(() {
        isSmallScreen = true;
      });
    } else if (isSmallScreen == true) {
      setState(() {
        isSmallScreen = false;
      });
    } // TODO(Anyone): Need to refine this entire process.
  }

  void _openLoginPannel() {
    setState(() {
      _accountPanelVisible = true;
    });
  }

  void _closeAccountPanel() {
    setState(() {
      _accountPanelVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _setScreenSize(MediaQuery.of(context).size);
    return Scaffold(
      appBar: FunWithAppBar(
        animationController: _controller,
        menuAnimation: _menuAnimation,
        menuVisible: _menuIsVisible,
        loginPressed: _openLoginPannel,
      ),
      body: ErrorListener(
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            _closeAccountPanel(); // close the account panel on auth state change for usability
          },
          child: AnimatedBuilder(
            animation: _menuAnimation,
            builder: (context, widget) {
              return Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      if (!isSmallScreen)
                        // this will push all the widgets to the right as the menu opens
                        SizedBox(width: _menuAnimation.value),
                      Expanded(child: AppPage()),
                    ],
                  ),
                  if (_menuIsVisible)
                    Transform.translate(
                      offset: Offset(-_menuSize + _menuAnimation.value, 0),
                      child: Container(
                        decoration: _menuShadowDecoration(isSmallScreen),
                        child: const MenuDrawer(
                          width: _menuSize,
                        ),
                      ),
                    ),
                  if (_accountPanelVisible)
                    OverlayPannel(
                      onClosedPressed: _closeAccountPanel,
                      child: AccountPage(),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Decoration _menuShadowDecoration(bool shouldDisplay) {
  if (shouldDisplay) {
    return const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(5.0, 10.0),
          blurRadius: 5.0,
          spreadRadius: 2.0,
        )
      ],
    );
  } else {
    return null;
  }
}
