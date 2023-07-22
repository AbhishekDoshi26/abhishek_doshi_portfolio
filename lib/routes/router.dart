import 'package:abhishek_doshi_portfolio/home/view/home_page.dart';
import 'package:auto_route/annotations.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // initial route is named "/"
    AutoRoute(page: HomePage, initial: true)
  ],
)
class $AppRouter {}
