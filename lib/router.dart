import 'package:flutter/material.dart';
import 'package:news_print_app/screens/auth_screens/screens/auth_screen.dart';
import 'package:news_print_app/screens/home_screens/screens/home_screen.dart';
import 'package:news_print_app/screens/onboarding/screens/onboarding_screen.dart';
import 'package:news_print_app/screens/auth_screens/screens/signin_with_phone_number_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case OnboardingScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const OnboardingScreen(),
        settings: routeSettings,
      );
    case SigninWithEmailScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SigninWithEmailScreen(),
        settings: routeSettings,
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: routeSettings,
      );
    // case OtpVerifyScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const OtpVerifyScreen(),
    //     settings: routeSettings,
    //   );
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
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
