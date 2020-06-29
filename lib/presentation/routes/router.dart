import 'package:auto_route/auto_route_annotations.dart';

import '../app/app.dart';
import '../sign_in/sign_in_page.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $Router {
  @initial
  App app;
  // HomePage homePage;
  SignInPage signInPage;
}
