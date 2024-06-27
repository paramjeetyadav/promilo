import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:promilo/core/route/route_name.dart';
import 'package:promilo/presentation/screens/description_screen.dart';
import 'package:promilo/presentation/screens/home_screen.dart';
import 'package:promilo/presentation/screens/login_screen.dart';
import 'package:promilo/presentation/screens/meetup_screen.dart';

import '../../presentation/screens/error_screen.dart';
import '../../presentation/screens/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  initialLocation: RouteName.splash,
  navigatorKey: _rootNavigatorKey,
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: RouteName.splash,
      name: RouteName.splash,
      builder: (_, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: RouteName.login,
      name: RouteName.login,
      builder: (_, state) {
        return const LoginScreen();
      },
    ),
    meetupShellRoute(_rootNavigatorKey)
    // GoRoute(
    //   path: RouteName.baseHome,
    //   name: RouteName.baseHome,
    //   builder: (_, state) {
    //     return const BaseHomeScreen();
    //   },
    //   routes: meetupRoute
    // ),
  ],
);
meetupShellRoute(key) => ShellRoute(
      navigatorKey: _shellNavigatorKey,
      parentNavigatorKey: key,
      routes: meetupRoute(key),
      pageBuilder: (context, state, child) {
        return NoTransitionPage(child: BaseHomeScreen(child: child));
      },
    );

meetupRoute(key) => [
      GoRoute(
        path: RouteName.description,
        name: RouteName.description,
        pageBuilder: (_, state) {
          return const NoTransitionPage(child: DescriptionScreen());
        },
      ),
      GoRoute(
        path: RouteName.meetup,
        name: RouteName.meetup,
        pageBuilder: (_, state) {
          return const NoTransitionPage(child: MeetupScreen());
        },
      ),
    ];
