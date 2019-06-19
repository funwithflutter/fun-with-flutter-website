import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlogEvent extends Equatable {
  BlogEvent([List props = const []]) : super(props);
}

class Fetch extends BlogEvent{
  @override
  String toString() => 'Fetch';
}
