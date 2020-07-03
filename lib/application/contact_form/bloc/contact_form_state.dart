part of 'contact_form_bloc.dart';

@freezed
abstract class ContactFormState with _$ContactFormState {
  const factory ContactFormState({
    @required Name name,
    @required ReplyTo replyTo,
    @required Message message,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required
        Option<Either<ContactFormFailure, Unit>> submitFailureOrSuccessOption,
  }) = _ContactFormState;

  factory ContactFormState.initial() => ContactFormState(
        name: Name(''),
        replyTo: ReplyTo(''),
        message: Message(''),
        showErrorMessages: false,
        isSubmitting: false,
        submitFailureOrSuccessOption: none(),
      );
}
