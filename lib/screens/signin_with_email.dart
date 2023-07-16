import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_print_app/constants/global_variable.dart';
import 'package:news_print_app/utils/widgets/custom_button.dart';

class SigninWithEmail extends StatelessWidget {
  static const String routeName = '/signin-with-email';
  const SigninWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
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
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 16, left: 16),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: GlobalVariables.textColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(right: 16, left: 16, top: 8),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          maxLines: 1,
                          minLines: 1,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: GlobalVariables.editTextStrokeColor,
                                width: 1,
                              ),
                            ),
                            hintText: "Enter you email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: GlobalVariables.editTextStrokeColor,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          bottom: 12,
                        ),
                        child: const Text(
                          "By continuing you are agreeing to the terms and use ",
                          style: TextStyle(
                              color: GlobalVariables.textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                      CustomButton(
                        onTap: () {
                          print('Continue pressed');
                        },
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
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
