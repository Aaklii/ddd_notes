// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#

import 'package:ddd_notes/domain/core/failures.dart';

// ********************##********************##********************#
// ********************##********************##********************#

// * Start of UnexpectedValueError
class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}

// ***************************END***************************
