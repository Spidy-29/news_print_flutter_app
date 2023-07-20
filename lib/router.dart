import 'package:flutter/material.dart';
import 'package:news_print_app/screens/home_screen.dart';
import 'package:news_print_app/screens/onboarding_screen.dart';
import 'package:news_print_app/screens/signin_with_email.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case OnboardingScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const OnboardingScreen(),
        settings: routeSettings,
      );
    case SigninWithEmail.routeName:
      return MaterialPageRoute(
        builder: (_) => const SigninWithEmail(),
        settings: routeSettings,
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: routeSettings,
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text("Screen Doestn't exist")),
        ),
        settings: routeSettings,
      );
  }
}
