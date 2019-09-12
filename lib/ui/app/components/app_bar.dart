import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/bloc.dart';
import 'package:fun_with_flutter/plugins/url_launcher/url_launcher.dart';
import 'package:fun_with_flutter/utils/urls.dart' as url;

// Todo(gordon): Refactor to encapsulate the animation within this widget
class FunWithAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FunWithAppBar({
    Key key,
    @required this.animationController,
    @required this.menuAnimation,
    @required this.menuVisible,
  })  : assert(
            animationController != null && menuAnimation != null && menuVisible != null),
        super(key: key);

  final AnimationController animationController;
  final Animation<double> menuAnimation;
  final bool menuVisible;

  @override
  Widget build(BuildContext context) {
    final pageBloc = BlocProvider.of<PageBloc>(context);
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return AppBar(
      title: GestureDetector(
        onTap: () {
          pageBloc.dispatch(UpdatePage(PageState.home));
        },
        child: Text(
          'Fun with Flutter',
          style: Theme.of(context).textTheme.display1,
        ),
      ),
      backgroundColor: Colors.transparent,
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
        FlatButton(
          child: const Text(
            'Github',
          ),
          onPressed: () {
            UrlUtils.open(url.funWithGithubUrl);
          },
        ),
        FlatButton(
          child: const Text(
            'YouTube',
          ),
          onPressed: () {
            UrlUtils.open(url.funWithYouTubeUrl);
          },
        ),
        FlatButton(
          onPressed: () {
            loginBloc.dispatch(
              LoginWithCredentialsPressed(
                  email: 'leeza@test.com', password: 'StrongPassword'),
            );
          },
          child: const Text('LoginFalse'),
        ),
        FlatButton(
          onPressed: () {
            authenticationBloc.dispatch(LoggedOut());
          },
          child: const Text('Logout'),
        ),
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isSuccess) {
              authenticationBloc.dispatch(LoggedIn());
            }
          },
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is Unauthenticated) {
                return FlatButton(
                  onPressed: () {
                    loginBloc.dispatch(
                      LoginWithCredentialsPressed(
                          email: 'leeza@test.com',
                          password: 'StrongPassword123'),
                    );
                  },
                  child: const Text('Login'),
                );
              }
              if (state is Authenticated) {
                return Text(
                  state.displayName,
                  style: TextStyle(color: Colors.green),
                );
              }
              return const Text('todo');
            },
          ),
        ),
      ],
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}