import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_print_app/constants/global_variable.dart';
import 'package:news_print_app/utils/widgets/custom_button.dart';
import 'package:news_print_app/utils/widgets/icon_with_text_row_widget.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  void onGoogleSignClick() {
    print("Google Sign In Click");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 2,
              ),
              child: const Text(
                "\"Through BuzzWire, we profoundly reinvented the news reading experience\"",
                style: TextStyle(
                  color: GlobalVariables.textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: const Text(
                "Please sign up to learn more about the personalised experience that has been crafted just for you. ",
                style: TextStyle(
                  color: GlobalVariables.textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              onTap: onGoogleSignClick,
              txtWidget: IconWithText(
                txt: "Sign In with Google",
                imageWidget: SvgPicture.asset("assets/images/ic_google.svg"),
              ),
              bgColor: GlobalVariables.bgColor,
              leftMargin: 24,
              rightMargin: 24,
            ),
            const SizedBox(
              height: 12,
            ),
            CustomButton(
              onTap: () {},
              txtWidget: const Text(
                "Sign In with Email",
                style: TextStyle(
                  fontSize: 14,
                  color: GlobalVariables.bgColor,
                ),
              ),
              leftMargin: 24,
              rightMargin: 24,
            ),
          ],
        )
      ],
    );
  }
}
