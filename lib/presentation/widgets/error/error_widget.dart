import 'package:flutter/material.dart';

import '../../core/themes.dart';

@immutable
class CustomError extends StatelessWidget {
  const CustomError({Key key, @required this.errorMessage})
      : assert(errorMessage != null),
        super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          errorMessage,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: AppTheme.errorColor,
              ),
        ), // TODO(Gordon): expand this
      ),
    );
  }
}
