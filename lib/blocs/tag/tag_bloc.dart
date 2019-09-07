// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:fun_with_flutter/blocs/blog/blog.dart';
// import 'package:fun_with_flutter/blocs/tag/tag.dart';
// import 'package:fun_with_flutter/models/blog_model.dart';

// class TagBloc extends Bloc<TagEvent, TagState> {
//   final BlogBloc blogBloc;
//   StreamSubscription _streamSubscription;
//   List<Tag> _tags;

//   TagBloc({@required this.blogBloc}) {
//     _streamSubscription = blogBloc.state.listen((state) {
//       if (state is BlogLoaded) {
//         dispatch(UpdateTags(state.blog.tags));
//       }
//     });
//   }

//   @override
//   TagState get initialState => TagsLoading();

//   @override
//   Stream<TagState> mapEventToState(
//     TagEvent event,
//   ) async* {
//     if (event is UpdateTags) {
//       _tags = event.tags;
//       yield TagsLoaded(_tags);
//     } else if (event is FilterTags) {
//       yield* _mapFilterTagsToState(event);
//     } else if (event is RemoveFilters) {
//       yield* _mapRemoveFiltersToSate(event);
//     }
//   }

//   // Stream<TagState> _mapUpdateTagsToState(UpdateTags event) async* {
//   //   yield TagsLoaded(event.tags);
//   // }

//   Stream<TagState> _mapFilterTagsToState(FilterTags event) async* {
//     final List<Tag> filteredTags = _mapFilterToFilteredTags(event.filter);
//     yield TagsFiltered(filteredTags, event.filter);
//   }

//   Stream<TagState> _mapRemoveFiltersToSate(RemoveFilters event) async* {
//     if (blogBloc.state is BlogLoaded) {
//       yield TagsLoaded((blogBloc.state as BlogLoaded).blog.tags);
//     }
//   }

//   List<Tag> _mapFilterToFilteredTags(String tagFilter) {
//     return _tags.where((tag) {
//       return (tag.name == tagFilter);
//     });
//   }

//   @override
//   void dispose() {
//     _streamSubscription.cancel();
//     super.dispose();
//   }
// }
