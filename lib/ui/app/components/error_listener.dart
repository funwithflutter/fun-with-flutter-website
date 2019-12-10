import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_with_flutter/blocs/bloc.dart';
import 'package:fun_with_flutter/ui/components/snackbar.dart';

class ErrorListener extends StatelessWidget {
  const ErrorListener({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MultiBlocListener(
        listeners: [
          BlocListener<BlogBloc, BlogState>(
            listener: (context, state) {
              if (state is BlogError) {
                Scaffold.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: ErrorSnackbar(
                        message: 'Could not load blog data.',
                      ),
                    ),
                  );
              }
            },
          ),
          // BlocListener<LoginBloc, LoginState>(
          //   listener: (context, state) {
          //     if (state.isFailure) {
          //       Scaffold.of(context)
          //         ..removeCurrentSnackBar()
          //         ..showSnackBar(
          //           SnackBar(
          //             content: const ErrorSnackbar(
          //               message: 'Error signing in.',
          //             ),
          //           ),
          //         );
          //     }
          //   },
          // )
        ],
        child: child,
      ),
    );
  }
}