import 'package:equatable/equatable.dart';
import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TagState extends Equatable {
  TagState([List props = const []]) : super(props);
}

class TagsLoading extends TagState {
  @override
  String toString() => 'TagsLoading';
}

class TagsLoaded extends TagState {
  TagsLoaded(this.tags) : super([tags]);

  final List<Tag> tags;

  @override
  String toString() => 'TagsLoaded';
}

class TagsFiltered extends TagState {
  TagsFiltered(this.tags, this.filter) : super([tags, filter]);

  final List<Tag> tags;
  final String filter;

  @override
  String toString() => 'TagsFiltered';
}

class TagsError extends TagState {
  @override
  String toString() => 'TagsError';
}
