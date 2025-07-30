import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_center/presentation/screens/auth/create.screen.dart';
import 'package:meditation_center/presentation/screens/auth/forgot.password.dart';
import 'package:meditation_center/presentation/screens/auth/login.screen.dart';
import 'package:meditation_center/presentation/screens/main/main.screen.dart';
import 'package:meditation_center/presentation/screens/settings/settings.screen.dart';
import 'package:meditation_center/presentation/screens/splash/splash.screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouting {
  final GoRouter appRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/main',
    routes: [
      GoRoute(
        path: '/',
        name: '/splash',
        builder: (context, state) => const SplashScreen(),
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
      GoRoute(
        path: '/main',
        name: 'main',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
