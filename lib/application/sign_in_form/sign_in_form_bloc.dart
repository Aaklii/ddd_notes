import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:ddd_notes/domain/auth/auth_failure.dart';
import 'package:ddd_notes/domain/auth/i_auth_facade.dart';
import 'package:ddd_notes/domain/auth/value_objects.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

//? SignInFormBloc transforms incoming events into states
@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  //? IAuthFacade will be used to call Authentication Methods from the Contract
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial());

  @override
  Stream<SignInFormState> mapEventToState(SignInFormEvent event,) async* {
    //? Using Union SignInFormEvent we can enforce every event of SignInFormEvent
    //? so that we don't miss any event using: yield* event.map
    yield* event.map(

      //? When SignInFormEvent.emailChanged(String emailStr) is triggered
      //? we want to update value of emailAddress from SignInFormState state.
      //? we have initial state having values of SignInFormState.initial()
      //? we just have to update values of emailAddress in state using copyWith()
      //? this event does contains the String value which we will pass using
      // EmailAddress ValueObject
      emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(e.emailStr),
          //? Option<Either<AuthFailure, Unit>>
          //? If registered successfully it will hold some(right(unit))
          //? If there is problem during registration it will hold some(left(unit))
          //? We reset the value of authFailureOrSuccessOption to none() when only
          //? values are changed
          authFailureOrSuccessOption: none(),
        );
      },

      //? Update the value of passwordChanged in state using copyWith()
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: Password(e.passwordStr),
          authFailureOrSuccessOption: none(),
        );
      },

      //? When SignInFormEvent.registerWithEmailAndPasswordPressed() is triggered
      //? IAuthFacade.registerWithEmailAndPassword will be called and states of
      //? isSubmitting, authFailureOrSuccessOption, showErrorMessages are updated
      registerWithEmailAndPasswordPressed: (e) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
          _authFacade.registerWithEmailAndPassword,
        );
      },

      //? When SignInFormEvent.signInWithEmailAndPasswordPressed() is triggered
      //? IAuthFacade.signInWithEmailAndPassword will be called and states of
      //? isSubmitting, authFailureOrSuccessOption, showErrorMessages are updated
      signInWithEmailAndPasswordPressed: (e) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
          _authFacade.signInWithEmailAndPassword,
        );
      },

      //? When SignInFormEvent.signInWithGooglePressed() is triggered
      //? IAuthFacade.signInWithGoogle will be called and states of
      //? isSubmitting, authFailureOrSuccessOption will initially be set
      signInWithGooglePressed: (e) async* {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        );
        //Option<Either<AuthFailure, Unit>>
        final failureOrSuccess = await _authFacade.signInWithGoogle();

        yield state.copyWith(
          isSubmitting: false,
          //? some will contain Either the success value or AuthFailure
          authFailureOrSuccessOption: some(failureOrSuccess),
        );
      },
    );
  }

  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword

  (

  //? Passing _authFacade.signInWithEmailAndPassword or
  //? Passing _authFacade.registerWithEmailAndPassword as a Function
  Future<Either<AuthFailure, Unit>> Function({
    @required EmailAddress emailAddress,
    @required Password password,})

  forwardedCall

  )

  async

  * {

  Either<AuthFailure, Unit> failureOrSuccess;

  final isEmailValid = state.emailAddress.isValid();
  final isPasswordValid = state.password.isValid();

  if (isEmailValid && isPasswordValid) {
  yield state.copyWith(
  isSubmitting: true,
  authFailureOrSuccessOption: none(),
  );

  failureOrSuccess = await forwardedCall(
  emailAddress: state.emailAddress,
  password: state.password,
  );
  }

  yield state.copyWith(
  isSubmitting: false,
  showErrorMessages: true,
  authFailureOrSuccessOption: optionOf(failureOrSuccess),
  );
  }
}
