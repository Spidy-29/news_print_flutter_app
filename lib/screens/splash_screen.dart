import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_print_app/screens/home_screen.dart';

//we convert this screen into stateFullWidget because this screen will remove after some duration and homeScreen will display.
//so this screen do some change so in stateFullWidget

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init function will call only one time during object creation
  @override
  void initState() {
    //DO timer thing that after some duration this screen will replace with homeScreen

    Timer(const Duration(seconds: 2), () {
      //this will replace screen to HomeScreen
      //so when user click back splash screen not comes. because it is replace in the stack Screens.
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/app_logo_279.svg",
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
