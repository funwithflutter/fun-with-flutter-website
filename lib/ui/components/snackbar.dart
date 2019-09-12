import 'package:flutter/material.dart';
import 'package:fun_with_flutter/themes.dart';
import 'package:fun_with_flutter/ui/widgets/error/error_widget.dart';

class LoadingSnackbar extends StatelessWidget {
  const LoadingSnackbar({Key key, this.message = 'Loading...'})
      : assert(message != null),
        super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: Theme.of(context).textTheme.title,
          overflow: TextOverflow.fade,
        ),
        const SizedBox(
          width: 32,
        ),
        Theme(
          data: Theme.of(context).copyWith(accentColor: AppTheme.accentColor),
          child: const CircularProgressIndicator(),
        ),
      ],
    );
  }
}

class InfoSnackbar extends StatelessWidget {
  const InfoSnackbar({Key key, @required this.message})
      : assert(message != null),
        super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: Theme.of(context).textTheme.title,
        overflow: TextOverflow.fade,
      ),
    );
  }
}

class ErrorSnackbar extends StatelessWidget {
  const ErrorSnackbar({Key key, this.message = 'Something went wrong'})
      : assert(message != null),
        super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CustomError(
          errorMessage: message,
        ),
      ],
    );
  }
}
