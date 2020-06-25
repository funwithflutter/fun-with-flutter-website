import 'package:meta/meta.dart';

@immutable
abstract class BlogEvent {
  const BlogEvent();
}

class Fetch extends BlogEvent {
  @override
  String toString() => 'Fetch';
}
