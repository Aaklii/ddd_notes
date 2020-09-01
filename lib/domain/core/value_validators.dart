import 'package:dartz/dartz.dart';
import 'package:ddd_notes/domain/core/failures.dart';

//? Validation need to be done for input of email in TextField
Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
  r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

//? Validation need to be done for input of password in TextField
Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}
