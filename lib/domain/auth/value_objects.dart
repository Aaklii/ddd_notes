import 'package:dartz/dartz.dart';
import 'package:ddd_notes/domain/core/failures.dart';
import 'package:ddd_notes/domain/core/value_object.dart';
import 'package:ddd_notes/domain/core/value_validators.dart';

//? EmailAddress ValueObject of String type
//? Having self validation property
class EmailAddress extends ValueObject<String> {
  //? Either returns failure if email input value is invalid
  //? If !(RegExp(emailRegex).hasMatch(input)) [value_validators.dart]
  //? else correct validated value if (RegExp(emailRegex).hasMatch(input))
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

//? Password ValueObject of String type
class Password extends ValueObject<String> {
  //? Either returns failure if password input value is invalid
  //? If !(input.length >= 6) [value_validators.dart]
  //? else correct validated value if (input.length >= 6)
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}
