import 'package:auto_route/auto_route.dart';
import 'package:filmy/views/app/app_extensions.dart';
import 'package:filmy/views/home_view/view.dart';
import 'package:filmy/views/login/view.dart';

export 'router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomePageView,
      path: QPathsRegistry.homePage,
    ),
    AutoRoute(
      page: LoginPageView,
      initial: true,
      path: QPathsRegistry.loginPage,
    ),
    // AutoRoute(page: BookDetailsPage),
  ],
)
class $AppRouter {}
