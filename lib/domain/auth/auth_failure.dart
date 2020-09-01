import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

//? AuthFailure with all possible expected failures which can occur
//? CancelledByUser : When on going process cancelled by User
//? ServerError : If internet connection is poor or no response or connection with server
//? EmailAlreadyInUse : If Email is already registered in database
//? InvalidEmailAndPasswordCombination : If Email and Password combination do not match
@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
  InvalidEmailAndPasswordCombination;
}
