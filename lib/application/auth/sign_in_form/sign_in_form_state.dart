part of 'sign_in_form_bloc.dart';

/*
//? Sealed classes are used for representing restricted class hierarchies,
//? when a value can have one of the types from a limited set,
//? but cannot have any other type. We use freezed package to create behaviour like
//? sealed class in flutter.
 */


//? In case of SignInFormState we don't need to have multiple States in Union Class
//? So we will have only one state SignInFormState containing the
//? elements which we will update based on
//? Event triggered by UI
@freezed
abstract class SignInFormState with _$SignInFormState {

  //? emailAddress: The value of email will be stored by bloc and output
  //? when text field value changes
  //? password: The value of password will be stored by bloc and output
  //? when text field value changes
  //? showErrorMessages: If the input value has error the widget in
  //? ui will be shown with error msg
  //? isSubmitting: When user hits any button the process of submitting set to true
  //? we can show progress indicator in ui
  //? authFailureOrSuccessOption: the value submitted gives out AuthFailure if there is any
  const factory SignInFormState({
    @required EmailAddress emailAddress,
    @required Password password,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  //? SignInFormState.initial() has preset with the needed values
  //? As initially all text fields will be set to empty and all output ui elements
  //? will be not be shown
  factory SignInFormState.initial() => SignInFormState(
    emailAddress: EmailAddress(''),
    password: Password(''),
    showErrorMessages: false,
    isSubmitting: false,
    authFailureOrSuccessOption: none(),
  );
}
