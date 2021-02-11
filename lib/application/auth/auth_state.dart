// ********************Part********************##

part of 'auth_bloc.dart';

// ********************##********************##

// * Start of AuthState
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.authenticated() = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
}

// ***************************END***************************
