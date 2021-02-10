// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'package:ddd_notes/domain/auth/auth_failure.dart';
import 'value_objects.dart';
import 'package:ddd_notes/domain/auth/user.dart';

// ********************##********************##********************#
// ********************##********************##********************#


// * Start of IAuthFacade
//? Interface of IAuthFacade class which will be implemented
//? concrete class in Infrastructure Layer
//? Containing methods which are events performed while Signing In/Up or Signing Out
abstract class IAuthFacade {
  //? getSignedInUser: To get the details about the current Signed In User
  Future<Option<User>> getSignedInUser();
  //? registerWithEmailAndPassword: To register a new User with Email and Password ValueObjects
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  //? signInWithEmailAndPassword: To sign in a User with Email and Password ValueObjects
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  //? signInWithGoogle: Signing in using Google
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  //? signOut: Sign Out
  Future<void> signOut();
}

// ***************************END***************************
