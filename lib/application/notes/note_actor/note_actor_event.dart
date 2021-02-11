// ********************Part********************##

part of 'note_actor_bloc.dart';

// ********************##********************##

// * Start of NoteActorEvent
@freezed
abstract class NoteActorEvent with _$NoteActorEvent {
  const factory NoteActorEvent.deleted(Note note) = _Deleted;
}

// ***************************END***************************