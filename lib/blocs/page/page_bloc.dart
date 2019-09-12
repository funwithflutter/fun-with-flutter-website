import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => PageState.home;

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is UpdatePage) {
      yield event.page;
    }
  }
}
