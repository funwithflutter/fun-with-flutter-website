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
        Theme(
          data: Theme.of(context).copyWith(accentColor: AppTheme.accentColor),
          child: const CircularProgressIndicator(),
        ),
        const SizedBox(width: 16,),
        Text(
          message,
          style: Theme.of(context).textTheme.title,
          overflow: TextOverflow.fade,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.info_outline, size: 32, color: AppTheme.accentColor,),
        const SizedBox(width: 16,),
        Text(
          message,
          style: Theme.of(context).textTheme.title,
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}

class SuccessSnackbar extends StatelessWidget {
  const SuccessSnackbar({Key key, @required this.message})
      : assert(message != null),
        super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.check, size: 32, color: AppTheme.primaryColor,),
        const SizedBox(width: 16,),
        Text(
          message,
          style: Theme.of(context).textTheme.title,
          overflow: TextOverflow.fade,
        ),
      ],
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
        Icon(
          Icons.error_outline,
          size: 32,
          color: AppTheme.errorColor,
        ),
        const SizedBox(width: 16,),
        CustomError(
          errorMessage: message,
        ),
      ],
    );
  }
}
