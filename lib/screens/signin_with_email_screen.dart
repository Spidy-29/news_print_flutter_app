import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_print_app/constants/global_variable.dart';
import 'package:news_print_app/utils/signin_with_email/widgets/signin_widget.dart';

class SigninWithEmailScreen extends StatelessWidget {
  static const String routeName = '/signin-with-email';
  const SigninWithEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bool isOtpScreen = false;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  color: GlobalVariables.lightGray,
                  child: SvgPicture.asset(
                    "assets/images/app_logo.svg",
                    width: 82,
                    height: 82,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SignInWidget(),
          ],
        ),
      ),
    );
  }
}
