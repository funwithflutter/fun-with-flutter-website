import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/app_state/bloc.dart';
import 'package:fun_with_flutter/blocs/bloc.dart';
import 'package:fun_with_flutter/themes.dart';

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

  @override
  Widget build(BuildContext context) {
    final pageBloc = BlocProvider.of<PageBloc>(context);

    return AppBar(
      title: GestureDetector(
        onTap: () {
          pageBloc.add(const UpdatePage(PageState.home));
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
                  BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                },
                child: const Text('Logout'),
              );
            } else {
              return FlatButton(
                onPressed: () {
                  BlocProvider.of<AppStateBloc>(context).add(
                    UpdateState(AppState.account),
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: AppTheme.accentColor, fontWeight: FontWeight.bold),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
