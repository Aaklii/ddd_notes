// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#

import 'package:freezed_annotation/freezed_annotation.dart';

// ********************##********************##********************#
// ********************##********************##********************#

// ********************Part********************##

part 'failures.freezed.dart';

// ********************##********************##

// * Start of ValueFailure
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  //? Expected Failure for Email
  const factory ValueFailure.invalidEmail({
    @required String failedValue,
  }) = InvalidEmail<T>;

  //? Expected Failure for Password
  const factory ValueFailure.shortPassword({
    @required String failedValue,
  }) = ShortPassword<T>;

  //? Expected Failure When length of note exceeds the defined max length
  const factory ValueFailure.exceedingLength({
    @required T failedValue,
    @required int max,
  }) = ExceedingLength<T>;

  //? Expected Failure for empty text field
  const factory ValueFailure.empty({
    @required T failedValue,
  }) = Empty<T>;

  //? Expected Failure for multiline TodoList
  const factory ValueFailure.multiline({
    @required T failedValue,
  }) = Multiline<T>;

  //? Expected Failure When length of a list exceeds the defined max length
  const factory ValueFailure.listTooLong({
    @required T failedValue,
    @required int max,
  }) = ListTooLong<T>;
}

// ***************************END***************************
