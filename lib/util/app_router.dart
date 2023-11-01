import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:testapp/view/pages/main_page.dart';
import 'package:testapp/view/pages/mbti_page.dart';
import 'package:testapp/view/pages/result_page.dart';
import 'package:testapp/view/pages/test_page.dart';

class AppRouter {
  static const String main = MainPage.route;
  static const String test = TestPage.route;
  static const String result = ResultPage.route;
  static const String mbti = MbtiPage.route;

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: main,
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: "/test",
        name: test,
        builder: (context, state) => const TestPage(),
      ),
      GoRoute(
        path: "/result",
        name: result,
        builder: (context, state) {
          return ResultPage(mbti: state.extra as String);
        },
      ),
      GoRoute(
        path: "/mbti",
        name: mbti,
        builder: (context, state) => const MbtiPage(),
      ),
    ],
  );

  //해당 페이지까지 뒤로 가기
  popUntil(BuildContext context, String route) {
    {
      final router = GoRouter.of(context);
      while (router.routerDelegate.currentConfiguration.matches.last
              .matchedLocation !=
          route) {
        if (!router.canPop()) {
          return;
        }
        context.pop();
      }
    }
  }
}
