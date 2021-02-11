// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ddd_notes/injection.dart';
import 'package:ddd_notes/presentation/core/app_widget.dart';

// ********************##********************##********************#
// ********************##********************##********************#

// * Start of main()
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await Firebase.initializeApp();
  runApp(AppWidget());
}

// ***************************END***************************
