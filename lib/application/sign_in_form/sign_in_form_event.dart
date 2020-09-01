part of 'sign_in_form_bloc.dart';

//? SignFormEvent class contains the Union classes of similar type having different value
@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  //? SignInFormEvent.emailChanged(String emailStr) will be called when user start
  //? putting values in TextField. Every time a value is added or changed in TextField
  //? this event will be triggered
  const factory SignInFormEvent.emailChanged(String emailStr) = EmailChanged;
  //? SignInFormEvent.passwordChanged(String emailStr) will be called when user start
  //? putting values in password TextField. Every time a value is added or changed
  //? in TextField this event will be triggered
  const factory SignInFormEvent.passwordChanged(String passwordStr) =
  PasswordChanged;
  //? SignInFormEvent.registerWithEmailAndPasswordPressed() is triggered
  //? when Register Button is pressed
  const factory SignInFormEvent.registerWithEmailAndPasswordPressed() =
  RegisterWithEmailAndPasswordPressed;
  //? SignInFormEvent.signInWithEmailAndPasswordPressed() is triggered
  //? when Sign In Button is pressed
  const factory SignInFormEvent.signInWithEmailAndPasswordPressed() =
  SignInWithEmailAndPasswordPressed;
  //? SignInFormEvent.signInWithGooglePressed() is triggered
  //? when Google Sign In Button is pressed
  const factory SignInFormEvent.signInWithGooglePressed() =
  SignInWithGooglePressed;
}
