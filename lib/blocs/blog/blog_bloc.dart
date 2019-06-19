import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_web/material.dart';
import 'package:fun_with_flutter/repository/blog_repository.dart';
import 'blog_event.dart';
import 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository _blogRepository;

  BlogBloc({@required BlogRepository blogRepository})
      : assert(blogRepository != null),
        _blogRepository = blogRepository;

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
      if ((currentState is BlogLoading) || (currentState is BlogError)) {
        final blog = await _blogRepository.getBlogData();
        List<String> tags = blog.tags.map((tag) => tag.name).toList();
        yield BlogLoaded(blog, tags);
        return;
      }
    } catch (_) {
      yield BlogError();
    }
  }
}
