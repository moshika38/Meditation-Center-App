import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_center/presentation/auth/create.screen.dart';
import 'package:meditation_center/presentation/auth/forgot.password.dart';
import 'package:meditation_center/presentation/auth/login.screen.dart';
import 'package:meditation_center/presentation/split/split.screen.dart';

   final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
class AppRouting {

 final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'split',
      builder: (context, state) => const SplitScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/create',
      name: 'create',
      builder: (context, state) => const CreateScreen(),
    ),
    GoRoute(
      path: '/forgot',
      name: 'forgot',
      builder: (context, state) => const ForgotPassword(),
    ),
  ],
);
}
