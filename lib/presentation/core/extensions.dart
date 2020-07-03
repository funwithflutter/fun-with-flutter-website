import 'package:flutter/widgets.dart';

extension SizeExtension on BuildContext {
  /// Performs a lookup using the `BuildContext` to obtain
  /// the MediaQuery size
  ///
  /// Calling this method is equivalent to calling:
  ///
  /// ```dart
  /// MediaQuery.of(context).size
  /// ```
  Size get mediaSize => MediaQuery.of(this).size;
}
