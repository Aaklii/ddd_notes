import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ddd_notes/domain/core/value_object.dart';

part 'user.freezed.dart';

//? User class with sealed
@freezed
abstract class User with _$User{
  //? User class with auto generated id in constructor
  const factory User({
    @required UniqueId id,
}) = _User;
}
