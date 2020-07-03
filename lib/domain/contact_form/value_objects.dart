import 'package:dartz/dartz.dart';

import '../core/failures.dart';
import '../core/value_objects.dart';
import '../core/value_validators.dart';

class Message extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

  factory Message(String input) {
    assert(input != null);
    return Message._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const Message._(this.value);
}

class ReplyTo extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ReplyTo(String input) {
    assert(input != null);
    return ReplyTo._(
      validateEmailAddress(input),
    );
  }

  const ReplyTo._(this.value);
}

class Name extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory Name(String input) {
    assert(input != null);
    return Name._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const Name._(this.value);
}
