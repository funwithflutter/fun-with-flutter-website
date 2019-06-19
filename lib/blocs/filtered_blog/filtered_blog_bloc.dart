import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_web/foundation.dart';
import 'package:fun_with_flutter/blocs/blog/blog.dart';
import 'package:fun_with_flutter/models/blog_model.dart';

import 'filtered_blog_event.dart';
import 'filtered_blog_state.dart';

class FilteredBlogBloc extends Bloc<FilteredBlogEvent, FilteredBlogState> {
  final BlogBloc blogBloc;
  StreamSubscription _blogSubscription;

  FilteredBlogBloc({@required this.blogBloc}) {
    _blogSubscription = blogBloc.state.listen((blogState) {
      if (blogState is BlogLoaded) {
        dispatch(
            UpdateFilteredBlog((blogBloc.currentState as BlogLoaded).blog));
      }
    });
  }

  @override
  FilteredBlogState get initialState {
    if (blogBloc.currentState is BlogLoaded) {
      return FilteredBlogLoaded((blogBloc.currentState as BlogLoaded).blog,
           "");
    } else {
      return FilteredBlogLoading();
    }
  }

  @override
  Stream<FilteredBlogState> mapEventToState(
    FilteredBlogEvent event,
  ) async* {
    if (event is UpdateFilteredBlog || event is ClearFilters) {
      yield* _mapUpdateFilterToState();
    } else if (event is FilterByTag) {
      yield* _mapTagFilterToState(event);
    }
  }

  Stream<FilteredBlogState> _mapUpdateFilterToState() async* {
    if (blogBloc.currentState is BlogLoaded) {
      yield FilteredBlogLoaded((blogBloc.currentState as BlogLoaded).blog, '');
    }
  }

  Stream<FilteredBlogState> _mapTagFilterToState(FilterByTag event) async* {
    if (blogBloc.currentState is BlogLoaded) {
      if (currentState is FilteredBlogLoaded) {
        String currentTag = (currentState as FilteredBlogLoaded).tagFilter;
        // Test if this filter has already been applied. If yes clear filters and return.
        if (currentTag == event.tagFilter) {
          yield* _mapUpdateFilterToState();
          return;
        }
      }
      final Blog filteredBlog = _mapTagFilterToFilteredBlog(
          (blogBloc.currentState as BlogLoaded).blog, event.tagFilter);
      yield FilteredBlogLoaded(filteredBlog, event.tagFilter);
    }
  }

  Blog _mapTagFilterToFilteredBlog(Blog blog, String tagFilter) {
    Tag filteredTag = blog.tags.firstWhere((tag) {
      return (tag.name == tagFilter);
    });
    return blog.copyWith(pages: filteredTag.pages);
  }

  @override
  void dispose() {
    _blogSubscription.cancel();
    super.dispose();
  }
}
