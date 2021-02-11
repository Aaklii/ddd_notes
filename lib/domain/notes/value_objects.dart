// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#
import 'dart:ui';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:ddd_notes/domain/core/failures.dart';
import 'package:ddd_notes/domain/core/value_object.dart';
import 'package:ddd_notes/domain/core/value_transformers.dart';
import 'package:ddd_notes/domain/core/value_validators.dart';

// ********************##********************##********************#
// ********************##********************##********************#

// * Start of NoteBody
//? NoteBody ValueObject of String type
//? Validation property for string length and non empty string
class NoteBody extends ValueObject<String> {
  //? Either returns failure if note length exceeds the defined limit:
  //? validateMaxStringLength:
  //? [ValueFailure.exceedingLength(failedValue: input, max: maxLength)]
  //? validateStringNotEmpty:
  //? [ValueFailure.empty({ @required T failedValue})]
  //? else return String if value is correctly validated
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 1000;

  factory NoteBody(String input) {
    assert(input != null);
    return NoteBody._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    );
  }

  const NoteBody._(this.value);
}

// ***************************END***************************

// * Start of TodoName
//? TodoName ValueObject of [String] type
//? Validation property for string length, non empty string,
//? and string input is in single line
class TodoName extends ValueObject<String> {
  //? Either returns failure if TodoName length exceeds the defined limit:
  //? validateMaxStringLength:
  //? [ValueFailure.exceedingLength(failedValue: input, max: maxLength)]
  //? validateStringNotEmpty:
  //? [ValueFailure.empty({ @required T failedValue})]
  //? validateSingleLine:
  //? [ValueFailure.multiline(failedValue: input)]
  //? else return String if value is correctly validated
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory TodoName(String input) {
    assert(input != null);
    return TodoName._(
      validateMaxStringLength(input, maxLength)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateSingleLine),
    );
  }

  const TodoName._(this.value);
}

// ***************************END***************************

// * Start of NoteColor
//? NoteColor ValueObject of [Color] type
//? Returns: Color with some Opacity
class NoteColor extends ValueObject<Color> {
  static const List<Color> predefinedColors = [
    Color(0xfffafafa), // canvas
    Color(0xfffa8072), // salmon
    Color(0xfffedc56), // mustard
    Color(0xffd0f0c0), // tea
    Color(0xfffca3b7), // flamingo
    Color(0xff997950), // tortilla
    Color(0xfffffdd0), // cream
  ];

  @override
  final Either<ValueFailure<Color>, Color> value;

  factory NoteColor(Color input) {
    assert(input != null);
    return NoteColor._(
      right(makeColorOpaque(input)),
    );
  }

  const NoteColor._(this.value);
}

// ***************************END***************************

// * Start of List3<T>
//? TodoName ValueObject of [KtList<T>] type
//? Validation property for length of list do not exceeds the defined limit
class List3<T> extends ValueObject<KtList<T>> {
  //? Either returns failure if List3<T> length exceeds the defined limit:
  //? validateMaxListLength:
  //? [ValueFailure.listTooLong(failedValue: input, max: maxLength)]
  //? else return KtList<T> if value is correctly validated
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  static const maxLength = 3;

  factory List3(KtList<T> input) {
    assert(input != null);
    return List3._(
      validateMaxListLength(input, maxLength),
    );
  }

  const List3._(this.value);

  //? method gives out length of the list
  int get length {
    return value.getOrElse(() => emptyList()).size;
  }

  //? method returns true if length of list is equal to the defined limit of list
  bool get isFull {
    return length == maxLength;
  }
}
// ***************************END***************************
