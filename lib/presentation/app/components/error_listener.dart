import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/blog/blog_bloc.dart';
import '../../core/constants.dart';
import '../../core/extensions.dart';
import '../../core/notification_helper.dart';

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
                NotificationHelper.error(
                  message: 'Could not load blog data',
                  isPhone: isPhoneSize(context.mediaSize),
                ).show(context);
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: child,
    );
  }
}
