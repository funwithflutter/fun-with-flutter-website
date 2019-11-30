import 'package:meta/meta.dart';

@immutable
abstract class BlogEvent {
  BlogEvent();
}

class Fetch extends BlogEvent {
  @override
  String toString() => 'Fetch';
}
