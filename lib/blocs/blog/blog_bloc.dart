import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fun_with_flutter/models/blog_model.dart';
import 'package:fun_with_flutter/repository/blog_repository.dart';
import 'blog_event.dart';
import 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc({@required BlogRepository blogRepository})
      : assert(blogRepository != null),
        _blogRepository = blogRepository;

  final BlogRepository _blogRepository;

  @override
  BlogState get initialState => BlogLoading();

  @override
  Stream<BlogState> mapEventToState(
    BlogEvent event,
  ) async* {
    if (event is Fetch) {
      yield* _mapFetchToState();
    }
  }

  Stream<BlogState> _mapFetchToState() async* {
    try {
      if ((state is BlogLoading) || (state is BlogError)) {
        final Blog blog = await _blogRepository.getBlogData();
        final List<String> tags = blog.tags.map((Tag tag) => tag.name).toList();
        yield BlogLoaded(blog, tags);
        return;
      }
    } catch (_) {
      yield BlogError();
    }
  }
}
