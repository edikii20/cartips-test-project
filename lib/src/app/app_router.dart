import 'package:cartips_test_project/src/pages/selector_page/ui/selector_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/my_codes_page/ui/my_codes_page.dart';
import '../pages/profile_page/profile_page.dart';
import '../pages/settings_page/ui/settings_page.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return SelectorPageWidget(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const MyCodesPageWidget(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
              transitionDuration: Duration.zero,
            ),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const SettingsPageWidget(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
              transitionDuration: Duration.zero,
            ),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const ProfilePageWidget(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
              transitionDuration: Duration.zero,
            ),
          ),
        ],
      ),
    ],
  );
}
