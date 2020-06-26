import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/user.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade);

  @override
  AuthState get initialState {
    _subscribeToAuthStateChanged();
    return const AuthState.initial();
  }

  StreamSubscription<Option<User>> _authStateStreamSubscription;

  void _subscribeToAuthStateChanged() {
    debugPrint('Subscribing to auth state changes');
    _authStateStreamSubscription =
        _authFacade.onAuthStateChanged.listen(_onAuthStateChangedListener);
  }

  void _unsubscribeFromAuthStateChanged() {
    debugPrint('Unsubscribing from AuthState changes');
    _authStateStreamSubscription.cancel();
  }

  void _onAuthStateChangedListener(Option<User> userOption) {
    debugPrint('AuthState changed');
    final isSignedIn = userOption.fold(
      () => false,
      (user) => true,
    );

    /// Only add onAuthStateChanged event if [isSignedIn] does not
    /// match the current auth state
    if ((isSignedIn && state is Authenticated) ||
        (!isSignedIn && state is Unauthenticated)) {
      return;
    }
    add(AuthEvent.onAuthStateChanged(isSignedIn: isSignedIn));
  }

  @override
  Future<void> close() {
    _unsubscribeFromAuthStateChanged();
    return super.close();
  }

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      authCheckRequested: (e) async* {
        final userOption = await _authFacade.getSignedInUser();
        yield userOption.fold(
          () => const AuthState.unauthenticated(),
          (_) => const AuthState.authenticated(),
        );
      },
      signOut: (e) async* {
        await _authFacade.signOut();
        yield const AuthState.unauthenticated();
      },
      onAuthStateChanged: (e) async* {
        if (e.isSignedIn) {
          yield const AuthState.authenticated();
        } else {
          yield const AuthState.unauthenticated();
        }
      },
    );
  }
}
