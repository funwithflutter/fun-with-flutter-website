import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:fun_with_flutter/blocs/blog/bloc.dart';
import 'package:fun_with_flutter/models/blog_model.dart';

import 'filtered_blog_event.dart';
import 'filtered_blog_state.dart';

class FilteredBlogBloc extends Bloc<FilteredBlogEvent, FilteredBlogState> {
  FilteredBlogBloc({@required this.blogBloc}) {
    _blogSubscription = blogBloc.listen((blogState) {
      if (blogState is BlogLoaded) {
        add(
            UpdateFilteredBlog((blogBloc.state as BlogLoaded).blog));
      }
    });
  }

  final BlogBloc blogBloc;
  StreamSubscription _blogSubscription;

  @override
  FilteredBlogState get initialState {
    if (blogBloc.state is BlogLoaded) {
      return FilteredBlogLoaded((blogBloc.state as BlogLoaded).blog, '');
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
    if (blogBloc.state is BlogLoaded) {
      yield FilteredBlogLoaded((blogBloc.state as BlogLoaded).blog, '');
    } else if (blogBloc.state is BlogError) {
      yield FilteredBlogError();
    }
  }

  Stream<FilteredBlogState> _mapTagFilterToState(FilterByTag event) async* {
    try {
      if (blogBloc.state is BlogLoaded) {
        if (state is FilteredBlogLoaded) {
          final String currentTag =
              (state as FilteredBlogLoaded).tagFilter;
          // Test if this filter has already been applied. If yes clear filters and return.
          if (currentTag == event.tagFilter) {
            yield* _mapUpdateFilterToState();
            return;
          }
        }
        final Blog filteredBlog = _mapTagFilterToFilteredBlog(
            (blogBloc.state as BlogLoaded).blog, event.tagFilter);
        yield FilteredBlogLoaded(filteredBlog, event.tagFilter);
      }
    } catch (e) {
      yield FilteredBlogError();
    }
  }

  Blog _mapTagFilterToFilteredBlog(Blog blog, String tagFilter) {
    final Tag filteredTag = blog.tags.firstWhere((tag) {
      return tag.name == tagFilter;
    });
    return blog.copyWith(pages: filteredTag.pages);
  }

  @override
  Future<void> close() {
    _blogSubscription.cancel();
    return super.close();
  }
}
