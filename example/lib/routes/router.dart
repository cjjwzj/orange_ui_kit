import 'package:example/icons/orange_icons.dart';
import 'package:example/pages/component_page.dart';
import 'package:example/pages/guide_page.dart';
import 'package:example/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/guide',
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          name: 'guide',
          path: '/guide',
          builder: (context, state) {
            return GuidePage();
          },
        ),
        GoRoute(
          name: 'component',
          path: '/component',
          builder: (context, state) {
            return ComponentPage();
          },
        ),
      ],
      builder: (context, state, child) {
        return MainScreen(child: child);
      },
    ),
  ],
);
