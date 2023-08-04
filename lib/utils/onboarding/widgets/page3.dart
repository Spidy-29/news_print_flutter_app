import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_print_app/constants/global_variable.dart';
import 'package:news_print_app/screens/home_screen.dart';
import 'package:news_print_app/screens/signin_with_phone_number_screen.dart';
import 'package:news_print_app/servers/auth_service.dart';
import 'package:news_print_app/utils/widgets/custom_button.dart';
import 'package:news_print_app/utils/widgets/icon_with_text_row_widget.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  void googleSignIn() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
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
          children: [
            CustomButton(
              onTap: () async {
                print("Button Clicked");
                await AuthService().signInWithGoogle();
                print("Function Called And Returned");
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
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
              onTap: () {
                Navigator.pushNamed(
                  context,
                  SigninWithEmailScreen.routeName,
                );
              },
              txtWidget: const Text(
                "Sign In with Phone Number",
                style: TextStyle(
                  fontSize: 14,
                  color: GlobalVariables.bgColor,
                ),
              ),
              leftMargin: 24,
              rightMargin: 24,
              bottomMargin: 30,
            ),
          ],
        )
      ],
    );
  }
}
