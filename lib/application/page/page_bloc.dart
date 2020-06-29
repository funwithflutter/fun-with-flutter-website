import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_bloc.freezed.dart';
part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => PageState.home;

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    yield* event.map(
      update: (e) async* {
        yield e.page;
      },
    );
  }
}
