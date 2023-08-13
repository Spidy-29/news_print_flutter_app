import 'package:flutter/material.dart';
import 'package:news_print_app/features/auth/screens/auth_screen.dart';
import 'package:news_print_app/features/auth/screens/signin_with_phone_number_screen.dart';
import 'package:news_print_app/features/notification/notification_screen.dart';
import 'package:news_print_app/features/onboarding/screens/onboarding_screen.dart';

import 'utils/widgets/custom_bottom_navigationbar_widget.dart';

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
    case CustomBottomNavigationBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const CustomBottomNavigationBar(),
        settings: routeSettings,
      );
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
        settings: routeSettings,
      );
    case NotificationScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const NotificationScreen(),
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
