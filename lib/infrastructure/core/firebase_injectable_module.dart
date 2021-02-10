// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

// ********************##********************##********************#
// ********************##********************##********************#

// * Start of FirebaseInjectableModule
@module
abstract class FirebaseInjectableModule {
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn();
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  @lazySingleton
  Firestore get firestore => Firestore.instance;
}

// ***************************END***************************
