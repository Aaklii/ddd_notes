import 'package:dartz/dartz.dart';
import 'package:ddd_notes/domain/core/errors.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ddd_notes/domain/core/failures.dart';
import 'package:uuid/uuid.dart';

//? ValueObject parent for Email and Password
//? The concept of identifier equality refers to entities,
//? the concept of structural equality to value objects.
//? Value objects should be immutable
@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  //? From Either class type Right() value is called when isValid is called
  bool isValid() => value.isRight();

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  //? This condition is called when we are interested in failure value from
  //? Either type. and instead of calling void from right side we
  //? call Unit which won't show unexpected behaviour in program
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
          (l) => left(l),
          (r) => right(unit),
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}


//? UniqueId ValueObject of String type
class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  //? Auto generated UniqueId to create a User Id
  factory UniqueId() {
    return UniqueId._(
      right(Uuid().v1()),
    );
  }

  //? UniqueId created using a String to create a Note Id
  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(
      right(uniqueId),
    );
  }

  const UniqueId._(this.value);
}
