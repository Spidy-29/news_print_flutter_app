// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_print_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:news_print_app/utils/widgets/custom_bottom_navigationbar_widget.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            // return Navigator.pushNamed(context, HomeScreen.routeName);
            return const CustomBottomNavigationBar();
          }
          // User is Not logged in
          else {
            // check App is opened first time

            return const OnboardingScreen();
          }
        },
      ),
    );
  }
}
