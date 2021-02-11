// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:ddd_notes/domain/auth/user.dart';
import 'package:ddd_notes/domain/core/value_object.dart';

// ********************##********************##********************#
// ********************##********************##********************#

// * Start of FirebaseUserDomainX
extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}

// ***************************END***************************