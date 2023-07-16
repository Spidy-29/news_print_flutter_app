import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_print_app/constants/global_variable.dart';
import 'package:news_print_app/utils/widgets/custom_button.dart';

class SigninWithEmail extends StatelessWidget {
  static const String routeName = '/signin-with-email';
  const SigninWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    TextInputControl _emailController;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: GlobalVariables.lightGray,
                  child: SvgPicture.asset(
                    "assets/images/app_logo.svg",
                    width: 82,
                    height: 82,
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Sign In",
              style: TextStyle(
                color: GlobalVariables.textColor,
                fontSize: 20,
              ),
            ),
            TextField(controller: _emailController,)
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                bottom: 12,
              ),
              child: const Text(
                "By continuing you are agreeing to the terms od use ",
                style: TextStyle(
                    color: GlobalVariables.textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w200),
              ),
            ),
            CustomButton(
              onTap: () {},
              txtWidget: const Text(
                "Continue",
                style: TextStyle(
                  color: GlobalVariables.bgColor,
                  fontSize: 14,
                ),
              ),
              leftMargin: 16,
              rightMargin: 16,
              bottomMargin: 32,
            )
          ],
        ),
      ),
    );
  }
}
