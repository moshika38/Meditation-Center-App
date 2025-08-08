import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_center/presentation/screens/auth/screens/create.screen.dart';
import 'package:meditation_center/presentation/screens/auth/screens/forgot.password.dart';
import 'package:meditation_center/presentation/screens/auth/screens/login.screen.dart';
import 'package:meditation_center/presentation/screens/auth/screens/verify.screen.dart';
import 'package:meditation_center/presentation/screens/main/main.screen.dart';
import 'package:meditation_center/presentation/screens/settings/settings.screen.dart';
import 'package:meditation_center/presentation/screens/splash/splash.screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouting {
  final GoRouter appRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: '/splash',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SplashScreen(),
          
          transitionDuration: Duration(seconds: 10),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
          transitionDuration: Duration(seconds: 10),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/create',
        name: 'create',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const CreateScreen(),
          transitionDuration: Duration(seconds: 10),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/forgot',
        name: 'forgot',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ForgotPassword(),
          transitionDuration: Duration(seconds: 10),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/verify',
        name: 'verify',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const VerifyScreen(),
          transitionDuration: Duration(seconds: 10),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/main',
        name: 'main',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MainScreen(),
          transitionDuration: Duration(seconds: 10),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SettingsScreen(),
          transitionDuration: Duration(seconds: 10),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
    ],
  );
}
