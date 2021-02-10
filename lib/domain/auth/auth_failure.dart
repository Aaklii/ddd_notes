// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#

import 'package:freezed_annotation/freezed_annotation.dart';

// ********************##********************##********************#
// ********************##********************##********************#

// ********************Part********************##

part 'auth_failure.freezed.dart';

// ********************##********************##

// * Start of AuthFailure
@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
}

// ***************************END***************************
