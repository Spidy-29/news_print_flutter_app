import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_print_app/constants/global_variable.dart';
import 'package:news_print_app/screens/home_screens/screens/home_screen.dart';
import 'package:news_print_app/utils/widgets/custom_button.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpVerifyWidget extends StatefulWidget {
  final String verificationId;
  final String userPhoneNumber;
  const OtpVerifyWidget({
    super.key,
    required this.verificationId,
    required this.userPhoneNumber,
  });

  @override
  State<OtpVerifyWidget> createState() => _OtpVerifyWidgetState();
}

class _OtpVerifyWidgetState extends State<OtpVerifyWidget> {
  late Timer timer;
  int secondRemaining = 30;
  String otpValue = "";
  bool enableResend = false;

  Future<void> resendOTP() async {
    startTimer();

    print(widget.userPhoneNumber);
    // Navigator.pushNamed(context, OtpVerifyScreen.routeName);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.userPhoneNumber,
      timeout: const Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // OTP Verify successful then go to homescreen
        // await FirebaseAuth.instance.signInWithCredential(credential);
        // print("OTP Verification Success");
      },
      verificationFailed: (FirebaseAuthException e) {
        // show message that OTP Failed
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        print('OTP sent');
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondRemaining != 0) {
        setState(() {
          secondRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
          timer.cancel();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: otpValue);

    // Sign the user in (or link) with the credential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushNamedAndRemoveUntil(
        context, HomeScreen.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                margin: const EdgeInsets.only(right: 4, left: 4, top: 24),
                disabledBorderColor: const Color(0xFFE4E4E4),
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFF333333),
                ),
              ),
              enableResend
                  ? Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 32, horizontal: 32),
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Haven't received the OTP? ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF666666),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                secondRemaining = 30;
                                enableResend = false;
                              });
                              resendOTP();
                            },
                            child: const Text(
                              "Resend OTP",
                              style: TextStyle(
                                fontSize: 14,
                                color: GlobalVariables.primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 32, horizontal: 32),
                      alignment: Alignment.topRight,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Send OTP again in ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF666666),
                              ),
                            ),
                            TextSpan(
                              text:
                                  "00:${secondRemaining < 10 ? 0 : ""}$secondRemaining",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF666666),
                              ),
                            ),
                            const TextSpan(
                              text: " sec",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomButton(
                onTap: () {
                  verifyOTP();
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
    );
  }
}
