import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fun_with_flutter/blocs/app_state/bloc.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppState> {
  @override
  AppState get initialState => AppState.normal;

  @override
  Stream<AppState> mapEventToState(
    AppStateEvent event,
  ) async* {
    if (event is UpdateState) {
      yield event.state;
    }
  }
}
