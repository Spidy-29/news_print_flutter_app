import 'package:flutter/material.dart';
import 'package:news_print_app/constants/global_variable.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 24,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            color: GlobalVariables.primaryColor,
            strokeWidth: 4,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            textAlign: TextAlign.center,
            "Rethinking...",
            style: TextStyle(
              fontSize: 24,
              color: GlobalVariables.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
