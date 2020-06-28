import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/blog/blog_bloc.dart';
import '../../components/snackbar.dart';

class ErrorListener extends StatelessWidget {
  const ErrorListener({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<BlogBloc, BlogState>(
          listener: (context, state) {
            state.maybeMap(
                error: (error) {
                  Scaffold.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: ErrorSnackbar(
                          message: 'Could not load blog data.',
                        ),
                      ),
                    );
                },
                orElse: () {});
            // if (state is BlogError) {
            //   Scaffold.of(context)
            //     ..removeCurrentSnackBar()
            //     ..showSnackBar(
            //       const SnackBar(
            //         content: ErrorSnackbar(
            //           message: 'Could not load blog data.',
            //         ),
            //       ),
            //     );
            // }
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
    );
  }
}
