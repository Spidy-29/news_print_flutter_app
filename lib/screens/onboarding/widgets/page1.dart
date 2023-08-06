import 'package:flutter/material.dart';
import 'package:news_print_app/constants/global_variable.dart';
import 'package:video_player/video_player.dart';

class OnboardingPage1 extends StatelessWidget {
  static late VideoPlayerController controller;
  const OnboardingPage1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 2,
          ),
          child: const Text(
            "A wise man once stated,",
            style: TextStyle(
              color: GlobalVariables.textColor,
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 2,
          ),
          child: const Text(
            "\"In earlier times, reading the news was great.\"",
            style: TextStyle(
              color: GlobalVariables.textColor,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: const Text(
            "Which completely made us to rethink the news reading experience.",
            style: TextStyle(
              color: GlobalVariables.textColor,
              fontSize: 14,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          width: double.maxFinite,
          margin: const EdgeInsets.only(
            right: 24,
            left: 24,
            top: 70,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(side: BorderSide(width: 0)),
              backgroundColor: GlobalVariables.primaryColor,
              alignment: Alignment.center,
              elevation: 1.0,
              padding: const EdgeInsets.all(20),
            ),
            onPressed: () {
              controller.play();
            },
            child: const Icon(
              Icons.arrow_right_alt_rounded,
            ),
          ),
        ),
      ],
    );
  }
}
