import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../application/page/page_bloc.dart';
import '../../../application/page/page_event.dart';
import '../../../application/page/page_state.dart';
import '../../common/adaptive_dialog.dart';
import '../../core/constants.dart';
import '../../sign_in/sign_in_page.dart';
import '../../themes.dart';

// Todo(gordon): Refactor to encapsulate the animation within this widget
class FunWithAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FunWithAppBar({
    Key key,
    @required this.animationController,
    @required this.menuAnimation,
    @required this.menuVisible,
  })  : assert(animationController != null &&
            menuAnimation != null &&
            menuVisible != null),
        super(key: key);

  final AnimationController animationController;
  final Animation<double> menuAnimation;
  final bool menuVisible;

  void _signInPressed(Size dimens, BuildContext context) {
    if (dimens.width >= kTabletBreakpoint) {
      showModal(
        context: context,
        configuration: const FadeScaleTransitionConfiguration(),
        builder: (BuildContext context) {
          return const AdaptiveDialog(
            child: SignInPage(),
          );
        },
      );
    } else {
      ExtendedNavigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => const SignInPage(),
        ),
      );
    }
  }

  void _signOutPressed(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(const AuthEvent.signOut());
  }

  @override
  Widget build(BuildContext context) {
    final pageBloc = BlocProvider.of<PageBloc>(context);

    final dimens = MediaQuery.of(context).size;

    return AppBar(
      title: GestureDetector(
        onTap: () {
          pageBloc.add(const UpdatePage(PageState.home));
        },
        child: Text(
          'FUN WITH FLUTTER',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          if (menuVisible) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: menuAnimation,
        ),
      ),
      actions: <Widget>[
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => Container(),
              authenticated: (_) => _signOutButton(context),
              unauthenticated: (_) => _signInButton(dimens, context),
            );
          },
        ),
      ],
    );
  }

  Widget _signOutButton(BuildContext context) => FlatButton(
        onPressed: () {
          _signOutPressed(context);
        },
        child: const Text(
          'Sign Out',
          style: TextStyle(
              color: AppTheme.accentColor, fontWeight: FontWeight.bold),
        ),
      );

  Widget _signInButton(Size dimens, BuildContext context) {
    return FlatButton(
      onPressed: () {
        _signInPressed(dimens, context);
      },
      child: const Text(
        'Login',
        style:
            TextStyle(color: AppTheme.accentColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
