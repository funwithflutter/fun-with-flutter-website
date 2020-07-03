import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/contact_form/contact_form.dart';
import '../../../domain/contact_form/contact_form_failure.dart';
import '../../../domain/contact_form/i_contact_form_repository.dart';
import '../../../domain/contact_form/value_objects.dart';

part 'contact_form_bloc.freezed.dart';
part 'contact_form_event.dart';
part 'contact_form_state.dart';

@injectable
class ContactFormBloc extends Bloc<ContactFormEvent, ContactFormState> {
  final IContactFormRepository _contactFormRepository;

  ContactFormBloc(this._contactFormRepository);

  @override
  ContactFormState get initialState => ContactFormState.initial();

  @override
  Stream<ContactFormState> mapEventToState(
    ContactFormEvent event,
  ) async* {
    yield* event.map(nameChanged: (e) async* {
      yield state.copyWith(
        name: Name(e.name),
        submitFailureOrSuccessOption: none(),
      );
    }, emailChanged: (e) async* {
      yield state.copyWith(
        replyTo: ReplyTo(e.email),
        submitFailureOrSuccessOption: none(),
      );
    }, messageChanged: (e) async* {
      yield state.copyWith(
        message: Message(e.message),
        submitFailureOrSuccessOption: none(),
      );
    }, submit: (_) async* {
      Either<ContactFormFailure, Unit> failureOrSuccess;

      final isReplyToValid = state.replyTo.isValid();
      final isNameValid = state.name.isValid();
      final messageValid = state.message.isValid();

      if (isReplyToValid && isNameValid && messageValid) {
        yield state.copyWith(
          isSubmitting: true,
          submitFailureOrSuccessOption: none(),
        );

        failureOrSuccess = await _contactFormRepository.submitForm(
          ContactForm(
            state.name,
            state.replyTo,
            state.message,
          ),
        );
      }
      yield state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        submitFailureOrSuccessOption: optionOf(failureOrSuccess),
      );
    });
  }
}
