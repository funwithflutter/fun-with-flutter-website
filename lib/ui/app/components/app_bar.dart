import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/bloc.dart';
import 'package:fun_with_flutter/themes.dart';

// Todo(gordon): Refactor to encapsulate the animation within this widget
class FunWithAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FunWithAppBar({
    Key key,
    @required this.animationController,
    @required this.menuAnimation,
    @required this.menuVisible,
    @required this.loginPressed,
  })  : assert(animationController != null &&
            menuAnimation != null &&
            menuVisible != null),
        super(key: key);

  final AnimationController animationController;
  final Animation<double> menuAnimation;
  final bool menuVisible;

  final VoidCallback loginPressed;

  void _loginPressed() {
    if (loginPressed != null) {
      loginPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageBloc = BlocProvider.of<PageBloc>(context);

    return AppBar(
      title: GestureDetector(
        onTap: () {
          pageBloc.dispatch(UpdatePage(PageState.home));
        },
        child: Text(
          'FUN WITH FLUTTER',
          style: Theme.of(context).textTheme.title,
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
        BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is Authenticated) {
              return FlatButton(
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context)
                      .dispatch(LoggedOut());
                },
                child: const Text('Logout'),
              );
            } else {
              return FlatButton(
                onPressed: _loginPressed,
                child: const Text(
                  'Login',
                  style: TextStyle(color: AppTheme.accentColor, fontWeight: FontWeight.bold),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
