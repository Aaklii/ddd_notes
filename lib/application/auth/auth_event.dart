// ********************Part********************##

part of 'auth_bloc.dart';

// ********************##********************##

// * Start of AuthEvent
@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authCheckRequested() = AuthCheckRequested;
  const factory AuthEvent.signedOut() = SignedOut;
}

// ***************************END***************************
