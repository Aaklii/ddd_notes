// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#
import 'package:freezed_annotation/freezed_annotation.dart';

// ********************##********************##********************#
// ********************##********************##********************#

// ********************Part********************##

part 'note_failure.freezed.dart';

// ********************##********************##

// * Start of NoteFailure
//? NoteFailure with all possible expected failures which can occur during taking notes
//? or showing notes
//? CancelledByUser : When on going process cancelled by User
//? ServerError : If internet connection is poor or no response or connection with server
//? EmailAlreadyInUse : If Email is already registered in database
//? InvalidEmailAndPasswordCombination : If Email and Password combination do not match
@freezed
abstract class NoteFailure with _$NoteFailure {
  const factory NoteFailure.unexpected() = _Unexpected;
  const factory NoteFailure.insufficientPermission() = _InsufficientPermission;
  const factory NoteFailure.unableToUpdate() = _UnableToUpdate;
}
// ***************************END***************************