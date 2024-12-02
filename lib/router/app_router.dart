import 'package:abhishek_doshi_portfolio/home/home.dart';
import 'package:abhishek_doshi_portfolio/router/router.dart';
import 'package:abhishek_doshi_portfolio/values/values.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: Routes.twitter,
      redirect: (context, state) async {
        await _launchUrl(
          Uri.parse(StringConst.TWITTER_URL),
          isNewTab: false,
        );
        return Routes.home;
      },
    ),
    GoRoute(
      path: Routes.linkedin,
      redirect: (context, state) async {
        await _launchUrl(
          Uri.parse(StringConst.LINKED_IN_URL),
          isNewTab: false,
        );
        return Routes.home;
      },
    ),
    GoRoute(
      path: Routes.instagram,
      redirect: (context, state) async {
        await _launchUrl(
          Uri.parse(StringConst.INSTAGRAM_URL),
          isNewTab: false,
        );
        return Routes.home;
      },
    ),
    GoRoute(
      path: Routes.github,
      redirect: (context, state) async {
        await _launchUrl(
          Uri.parse(StringConst.GITHUB_URL),
          isNewTab: false,
        );
        return Routes.home;
      },
    ),
    GoRoute(
      path: Routes.medium,
      redirect: (context, state) async {
        await _launchUrl(
          Uri.parse(StringConst.MEDIUM_URL),
          isNewTab: false,
        );
        return Routes.home;
      },
    ),
    GoRoute(
      path: Routes.cv,
      redirect: (context, state) async {
        await _launchUrl(
          Uri.parse(StringConst.CV_URL),
          isNewTab: false,
        );
        return Routes.home;
      },
    ),
    GoRoute(
      path: Routes.email,
      redirect: (context, state) async {
        await _launchUrl(
          Uri.parse(StringConst.EMAIL_URL),
          isNewTab: false,
        );
        return Routes.home;
      },
    ),
    GoRoute(
      path: Routes.wasm,
      redirect: (context, state) async {
        await _launchUrl(
          Uri.parse(StringConst.wasmBlog),
          isNewTab: false,
        );
        return Routes.home;
      },
    ),
    GoRoute(
      path: Routes.wasmExample,
      redirect: (context, state) async {
        await _launchUrl(
          Uri.parse(StringConst.wasmExample),
          isNewTab: false,
        );
        return Routes.home;
      },
    ),
  ],
);

Future<void> _launchUrl(Uri urlLink, {bool isNewTab = true}) async {
  if (!await launchUrl(
    urlLink,
    webOnlyWindowName: isNewTab ? '_blank' : '_self',
  )) {
    throw Exception('Could not launch $urlLink');
  }
}
