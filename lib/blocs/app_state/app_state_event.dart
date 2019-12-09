import 'package:meta/meta.dart';

import 'app_state_state.dart';

@immutable
abstract class AppStateEvent {}

class UpdateState extends AppStateEvent {
  UpdateState(this.state);

  final AppState state;

  @override
  String toString() => 'UpdateState {page: $state}';
}
