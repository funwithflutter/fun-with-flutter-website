import 'package:flutter/material.dart';
import 'package:fun_with_flutter/themes.dart';

@immutable
class CustomError extends StatelessWidget {
  const CustomError({Key key, @required this.errorMessage})
      : assert(errorMessage != null),
        super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        errorMessage,
        overflow: TextOverflow.fade,
        style: Theme.of(context).textTheme.title.copyWith(
              color: AppTheme.errorColor,
            ),
      ), // TODO(Gordon): expand this
    );
  }
}
