// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#
import 'package:auto_route/auto_route_annotations.dart';
import 'package:ddd_notes/presentation/sign_in/sign_in_page.dart';
import 'package:ddd_notes/presentation/splash/splash_page.dart';
import 'package:ddd_notes/presentation/notes/note_form/note_form_page.dart';
import 'package:ddd_notes/presentation/notes/notes_overview/notes_overview_page.dart';
// ********************##********************##********************#
// ********************##********************##********************#

// * Start of MaterialAutoRouter
@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: NotesOverviewPage),
    MaterialRoute(page: NoteFormPage, fullscreenDialog: true),
  ],
)

// ***************************END***************************

// * Start of $Router
class $Router {}

// ***************************END***************************
