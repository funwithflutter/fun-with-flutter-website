import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/blog/blog.dart';
import '../../domain/blog/tag.dart';
import '../blog/blog_bloc.dart';

part 'filtered_blog_bloc.freezed.dart';
part 'filtered_blog_event.dart';
part 'filtered_blog_state.dart';

class FilterBlogBloc extends Bloc<FilterBlogEvent, FilterBlogState> {
  FilterBlogBloc({@required this.blogBloc})
      : super(blogBloc.state.map(
          initial: (_) => const FilterBlogState.loading(),
          loading: (_) => const FilterBlogState.loading(),
          error: (_) => const FilterBlogState.error(),
          loaded: (s) => FilterBlogState.loaded(s.blog, ''),
        )) {
    _blogSubscription = blogBloc.listen((blogState) {
      blogState.maybeMap(
        loaded: (blogState) {
          add(FilterBlogEvent.update(blogState.blog));
        },
        orElse: () {
          add(const FilterBlogEvent.errorFromBlog());
        },
      );
    });
  }

  final BlogBloc blogBloc;
  StreamSubscription _blogSubscription;

  @override
  Stream<FilterBlogState> mapEventToState(
    FilterBlogEvent event,
  ) async* {
    yield* event.map(
      update: (_) async* {
        yield* _mapUpdateFilterToState();
      },
      filterByTag: (e) async* {
        yield* _mapTagFilterToState(e);
      },
      clearFilters: (_) async* {
        yield* blogBloc.state.maybeMap(loaded: (s) async* {
          yield FilterBlogState.loaded(s.blog, '');
        }, orElse: () async* {
          yield const FilterBlogState.error();
        });
      },
      errorFromBlog: (_) async* {
        yield const FilterBlogState.error();
      },
    );
  }

  Stream<FilterBlogState> _mapUpdateFilterToState() async* {
    yield* blogBloc.state.maybeMap(
      loaded: (s) async* {
        yield FilterBlogState.loaded(s.blog, 'tagFilter');
      },
      orElse: () async* {
        yield const FilterBlogState.error();
      },
    );
  }

  Stream<FilterBlogState> _mapTagFilterToState(_FilterByTag event) async* {
    yield* blogBloc.state.maybeMap(
      loaded: (blogState) async* {
        yield* state.maybeMap(
          loaded: (s) async* {
            final currentTag = s.tagFilter;
            if (currentTag == event.tag) {
              yield* _mapUpdateFilterToState();
              return;
            }
            try {
              final filteredBlog =
                  _mapTagFilterToFilteredBlog(blogState.blog, event.tag);
              yield FilterBlogState.loaded(filteredBlog, event.tag);
            } catch (_) {
              yield const FilterBlogState.error();
            }
          },
          orElse: () async* {
            yield const FilterBlogState.error();
          },
        );
      },
      orElse: () async* {
        yield const FilterBlogState.error();
      },
    );
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
