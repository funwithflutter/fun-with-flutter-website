import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:fun_with_flutter/utils/validator.dart';
import 'package:meta/meta.dart';
import 'package:fun_with_flutter/repository/user_repository.dart';
import './bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> transformEvents(
    Stream<LoginEvent> events,
    Stream<LoginState> Function(LoginEvent event) next,
  ) {
    final observableStream = events;
    final nonDebounceStream = observableStream.where((event) {
      return event is! EmailChanged && event is! PasswordChanged;
    });
    final debounceStream = observableStream.where((event) {
      return event is EmailChanged || event is PasswordChanged;
    }).debounceTime(const Duration(milliseconds: 300));
    return super
        .transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressedToState();
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
    LoginState state;
    await _userRepository.signInWithGoogle().then((onValue) {
      state = LoginState.success();
    }).catchError((onError) {
      state = LoginState.failure(onError);
    });
    yield state;
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    LoginState state;
    await _userRepository
        .signInWithCredentials(email, password)
        .then((onValue) {
      state = LoginState.success();
    }).catchError((onError) {
      state = LoginState.failure(onError);
    });
    yield state;
  }
}
