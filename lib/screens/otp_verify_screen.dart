import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_print_app/constants/global_variable.dart';
import 'package:news_print_app/screens/home_screen.dart';
import 'package:news_print_app/utils/widgets/custom_button.dart';

class OtpVerifyScreen extends StatefulWidget {
  static const String routeName = '/otp-verify';
  final String verificationId;
  const OtpVerifyScreen({super.key, required this.verificationId});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  String otpValue = "";
  late Timer timer;
  int secondRemaining = 30;
  bool enableResend = false;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (secondRemaining != 0) {
          setState(() {
            secondRemaining--;
          });
        } else {
          setState(() {
            enableResend = true;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    void verifyOTP(String otp) async {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId, smsCode: otp);

      // Sign the user in (or link) with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushNamed(context, HomeScreen.routeName);
    }

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
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "OTP Verification",
                        style: TextStyle(
                          color: GlobalVariables.textColor,
                          fontSize: 20,
                        ),
                      ),
                      OtpTextField(
                        numberOfFields: 6,
                        borderColor: const Color(0xFFE4E4E4),
                        borderRadius: BorderRadius.circular(8),
                        borderWidth: 1,
                        fillColor: const Color(0xFFEAEAEA),
                        filled: true,
                        cursorColor: GlobalVariables.primaryColor,
                        showFieldAsBox: true,
                        focusedBorderColor: GlobalVariables.primaryColor,
                        onSubmit: (value) {
                          otpValue = value;
                        },
                        fieldWidth: 44,
                        keyboardType: TextInputType.number,
                        showCursor: true,
                        margin:
                            const EdgeInsets.only(right: 4, left: 4, top: 24),
                        disabledBorderColor: const Color(0xFFE4E4E4),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFF333333),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 32),
                        color: Colors.black54,
                        alignment: Alignment.topRight,
                        child: const Text(
                          "Resend OTP is ",
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomButton(
                        onTap: () {
                          verifyOTP(otpValue);
                        },
                        txtWidget: const Text(
                          "Verify OTP",
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
            ),
          ],
        ),
      ),
    );
  }
}
