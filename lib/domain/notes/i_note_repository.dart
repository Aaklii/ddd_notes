// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:ddd_notes/domain/notes/note.dart';
import 'package:ddd_notes/domain/notes/note_failure.dart';

// ********************##********************##********************#
// ********************##********************##********************#

// * Start of INoteRepository
//? Interface of INoteRepository class which will be implemented
//? concrete class in Infrastructure Layer
//? Containing methods which are events performed like
//? watchAll
//? watchUncompleted
//? create
//? update
//? delete
abstract class INoteRepository {
  //? watchAll: To get all the notes
  Stream<Either<NoteFailure, KtList<Note>>> watchAll();
  //? watchUncompleted: To get all the uncompleted notes
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();
  //? create: To create note
  Future<Either<NoteFailure, Unit>> create(Note note);
  //? update: To update note
  Future<Either<NoteFailure, Unit>> update(Note note);
  //? delete: To delete note
  Future<Either<NoteFailure, Unit>> delete(Note note);
}

// ***************************END***************************