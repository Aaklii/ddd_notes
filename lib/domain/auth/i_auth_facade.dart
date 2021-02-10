// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'package:ddd_notes/domain/auth/auth_failure.dart';
import 'value_objects.dart';

// ********************##********************##********************#
// ********************##********************##********************#


// * Start of IAuthFacade
abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}

// ***************************END***************************
