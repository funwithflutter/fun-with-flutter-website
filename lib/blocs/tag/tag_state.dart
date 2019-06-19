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
  final List<Tag> tags;

  TagsLoaded(this.tags) : super([tags]);

  @override
  String toString() => 'TagsLoaded';
}

class TagsFiltered extends TagState {
  final List<Tag> tags;
  final String filter;

  TagsFiltered(this.tags, this.filter) : super([tags, filter]);

  @override
  String toString() => 'TagsFiltered';
}

class TagsError extends TagState {
  @override
  String toString() => 'TagsError';
}
