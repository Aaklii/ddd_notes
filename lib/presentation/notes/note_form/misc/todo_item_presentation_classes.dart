// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ddd_notes/domain/core/value_object.dart';
import 'package:ddd_notes/domain/notes/todo_item.dart';
import 'package:ddd_notes/domain/notes/value_objects.dart';

// ********************##********************##********************#
// ********************##********************##********************#

// ********************Part********************##

part 'todo_item_presentation_classes.freezed.dart';

// ********************##********************##


// * Start of TodoItemPrimitive
@freezed
abstract class TodoItemPrimitive implements _$TodoItemPrimitive {
  const TodoItemPrimitive._();

  const factory TodoItemPrimitive({
    @required UniqueId id,
    @required String name,
    @required bool done,
  }) = _TodoItemPrimitive;

  factory TodoItemPrimitive.empty() => TodoItemPrimitive(
        id: UniqueId(),
        name: '',
        done: false,
      );

  factory TodoItemPrimitive.fromDomain(TodoItem todoItem) {
    return TodoItemPrimitive(
      id: todoItem.id,
      name: todoItem.name.getOrCrash(),
      done: todoItem.done,
    );
  }

  TodoItem toDomain() {
    return TodoItem(
      id: id,
      name: TodoName(name),
      done: done,
    );
  }
}

// ***************************END***************************
