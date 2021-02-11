// ********************##********************##********************#
// ********************##********************##********************#
// ********************##********************##********************#
import 'package:auto_route/auto_route_annotations.dart';
import 'package:ddd_notes/presentation/sign_in/sign_in_page.dart';
import 'package:ddd_notes/presentation/splash/splash_page.dart';
// ********************##********************##********************#
// ********************##********************##********************#

// * Start of MaterialAutoRouter
@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
  ],
)

// ***************************END***************************

// * Start of $Router
class $Router {}

// ***************************END***************************
