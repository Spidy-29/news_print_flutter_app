import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_print_app/utils/signin_with_email/widgets/otp_verify_widget.dart';

class OtpVerifyScreen extends StatelessWidget {
  static const String routeName = '/otp-verify';
  const OtpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue[600],
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: SizedBox(
                    child: SvgPicture.asset(
                      "assets/images/app_logo.svg",
                      width: 82,
                      height: 82,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const OtpVerifyWidget(),
          ],
        ),
      ),
    );
  }
}
