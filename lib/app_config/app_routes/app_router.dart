import 'package:ardilla_test/app_config/constants/route_path.dart';
import 'package:ardilla_test/features/app_home.dart';
import 'package:ardilla_test/features/onboarding/presentation/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages.dart';
import '../../features/dashboard/presentation/dashboard.dart';
import '../../features/splashscreen/presentation/splashscreen_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      
       GoRoute(
          path: RoutePath.appHome,
          builder: (BuildContext context, GoRouterState state) {
            return const AppHome();
          }),
       GoRoute(
          path: RoutePath.splashScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const SplashScreen();
          }),
      GoRoute(
          path: RoutePath.onBoarding,
          builder: (BuildContext context, GoRouterState state) {
            return const OnBoardingPage();
          }),
      GoRoute(
          path: RoutePath.getStarted,
          builder: (BuildContext context, GoRouterState state) {
            return const GetStarted();
          }),
      GoRoute(
          path: RoutePath.verifyEmail,
          builder: (BuildContext context, GoRouterState state) {
            return const VerifyEmail();
          }),
      GoRoute(
          path: RoutePath.signUp,
          builder: (BuildContext context, GoRouterState state) {
            return const SignUp();
          }),
      GoRoute(
          path: RoutePath.login,
          builder: (BuildContext context, GoRouterState state) {
            return const Login();
          }),
      GoRoute(
          path: RoutePath.dashBoard,
          builder: (BuildContext context, GoRouterState state) {
            return const DashBoard();
          }),
      GoRoute(
          path: RoutePath.login,
          builder: (BuildContext context, GoRouterState state) {
            return const Login();
          }),
    ],
  );
}
