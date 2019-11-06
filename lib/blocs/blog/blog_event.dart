import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object> get props => null;
}

class Fetch extends BlogEvent {
  @override
  String toString() => 'Fetch';
}
