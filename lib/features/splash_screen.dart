import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_print_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:news_print_app/utils/widgets/custom_bottom_navigationbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

//we convert this screen into stateFullWidget because this screen will remove after some duration and homeScreen will display.
//so this screen do some change so in stateFullWidget

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init function will call only one time during object creation

  bool showOnboarding = true;
  checkAppStartFirstTime() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getBool('isAppStartedFirstTime') == null) {
      showOnboarding = true;
    } else {
      showOnboarding = pref.getBool('isAppStartedFirstTime')!;
    }
  }

  @override
  void initState() {
    //DO timer thing that after some duration this screen will replace with homeScreen

    checkAppStartFirstTime();

    Timer(
      const Duration(seconds: 2),
      () async {
        //this will replace screen to HomeScreen
        //so when user click back splash screen not comes. because it is replace in the stack Screens.
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.pushReplacementNamed(context, CustomBottomNavigationBar.routeName);
        } else {
          if (showOnboarding)  {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setBool('isAppStartedFirstTime', false);
            Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
          } else {
            Navigator.pushReplacementNamed(context, CustomBottomNavigationBar.routeName);
          }
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/app_logo.svg",
            width: 107,
            height: 107,
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "NEWS PRINT",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}
