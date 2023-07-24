import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_print_app/constants/global_variable.dart';
import 'package:news_print_app/screens/home_screen.dart';
import 'package:news_print_app/utils/widgets/custom_button.dart';

class SigninWithEmailScreen extends StatefulWidget {
  static const String routeName = '/signin-with-email';
  const SigninWithEmailScreen({super.key});

  @override
  State<SigninWithEmailScreen> createState() => _SigninWithEmailScreenState();
}

class _SigninWithEmailScreenState extends State<SigninWithEmailScreen> {
  final TextEditingController emailController = TextEditingController();

  bool isOtpScreen = false;
  String otpValue = '';
  String firebaseVerificationId = "";
  @override
  void dispose() {
    super.dispose();
  }

  sendOtpToUserEmail() async {
    String userEmail = emailController.text.toString();
    print(userEmail);
    // Navigator.pushNamed(context, OtpVerifyScreen.routeName);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: userEmail,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // OTP Verify successful then go to homescreen
        await FirebaseAuth.instance.signInWithCredential(credential);
        print("OTP Verification Success");

        setState(() {
          isOtpScreen = !isOtpScreen;
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        // show message that OTP Failed
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        firebaseVerificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  SvgPicture.asset('assets/images/login_background.svg',
                      fit: BoxFit.cover),
                  Center(
                    child: SizedBox(
                      child: SvgPicture.asset(
                        "assets/images/app_logo.svg",
                        width: 82,
                        height: 82,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            isOtpScreen
                ?
                // OTP Screens
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
                                // imidiate call when all otp value enter in field
                                otpValue = value;
                              },
                              fieldWidth: 44,
                              keyboardType: TextInputType.number,
                              showCursor: true,
                              margin: const EdgeInsets.only(
                                  right: 4, left: 4, top: 24),
                              disabledBorderColor: const Color(0xFFE4E4E4),
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFF333333),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 32),
                              child: const Text(
                                "Resend OTP is 4:29 ",
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
                              onTap: () async {
                                // Create a PhoneAuthCredential with the code
                                PhoneAuthCredential credential =
                                    PhoneAuthProvider.credential(
                                        verificationId: firebaseVerificationId,
                                        smsCode: otpValue);

                                // Sign the user in (or link) with the credential
                                await FirebaseAuth.instance
                                    .signInWithCredential(credential);
                                Navigator.pushNamed(context, HomeScreen.routeName);
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
                  )
                :
                // Sign In Screens
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
                              margin:
                                  const EdgeInsets.only(right: 16, left: 16),
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  color: GlobalVariables.textColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  right: 16, left: 16, top: 8),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                maxLines: 1,
                                minLines: 1,
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide: BorderSide(
                                      color:
                                          GlobalVariables.editTextStrokeColor,
                                      width: 1,
                                    ),
                                  ),
                                  hintText: "Enter you email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    borderSide: BorderSide(
                                      color:
                                          GlobalVariables.editTextStrokeColor,
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
                                // verify Email Address is Correct Or not
                                // if (RegExp(
                                //         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                //     .hasMatch(
                                //         emailController.text.toString())) {
                                sendOtpToUserEmail();
                                // } else {
                                //   // Address validation Faild
                                //   print("Enter Valid Email Address");
                                // }
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
                  ),
          ],
        ),
      ),
    );
  }
}
