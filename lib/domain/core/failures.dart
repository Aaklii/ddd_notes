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
  const factory ValueFailure.invalidEmail({
    @required String failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @required String failedValue,
  }) = ShortPassword<T>;
}

// ***************************END***************************
