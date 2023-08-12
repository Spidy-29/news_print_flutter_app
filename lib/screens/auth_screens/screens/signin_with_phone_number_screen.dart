import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_print_app/constants/global_variable.dart';
import 'package:news_print_app/constants/utils.dart';
import 'package:news_print_app/utils/signin_with_email/widgets/otp_verify_widget.dart';
import 'package:news_print_app/utils/widgets/custom_button.dart';
import 'package:news_print_app/utils/widgets/loder.dart';

class SigninWithEmailScreen extends StatefulWidget {
  static const String routeName = '/signin-with-email';
  const SigninWithEmailScreen({super.key});

  @override
  State<SigninWithEmailScreen> createState() => _SigninWithEmailScreenState();
}

class _SigninWithEmailScreenState extends State<SigninWithEmailScreen> {
  final TextEditingController phoneNumberController = TextEditingController();

  bool isOtpScreen = false;
  bool isOtpSending = false;
  String firebaseVerificationId = "";
  String userPhoneNumber = "";
  String otpValue = "";

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }

  sendOtpToUserPhoneNumber() async {
    userPhoneNumber = "+91${phoneNumberController.text.toString()}";
    print(userPhoneNumber);
    // Navigator.pushNamed(context, OtpVerifyScreen.routeName);
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: userPhoneNumber,
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
          firebaseVerificationId = verificationId;
          print('OTP sent');
          setState(() {
            isOtpScreen = true;
            isOtpSending = false;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      setState(() {
        isOtpSending = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          if (isOtpScreen) {
            setState(() {
              isOtpScreen = !isOtpScreen;
            });
            return Future.value(false);
          }
          return Future.value(true);
        },
        child: SafeArea(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: SvgPicture.asset(
                              "assets/images/app_logo.svg",
                              width: 82,
                              height: 82,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'BuzzWire',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
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
                  OtpVerifyWidget(
                      verificationId: firebaseVerificationId,
                      userPhoneNumber: userPhoneNumber,
                    )
                  : isOtpSending
                      ? const Loader()
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
                                    margin: const EdgeInsets.only(
                                        right: 16, left: 16),
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
                                        right: 16, left: 16, top: 16),
                                    child: TextField(
                                      keyboardType: TextInputType.phone,
                                      controller: phoneNumberController,
                                      maxLength: 10,
                                      decoration: const InputDecoration(
                                        labelText: 'Phone Number',
                                        helperText: null,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          borderSide: BorderSide(
                                            color: GlobalVariables
                                                .editTextStrokeColor,
                                            width: 1,
                                          ),
                                        ),
                                        hintText: "Enter you phone number",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          borderSide: BorderSide(
                                            color: GlobalVariables
                                                .editTextStrokeColor,
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
                                      if (phoneNumberController.text.length <
                                          10) {
                                        showSnackBar(
                                            context, "Enter Your Phone Number");
                                      } else {
                                        sendOtpToUserPhoneNumber();
                                        setState(() {
                                          isOtpSending = true;
                                        });
                                      }
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
      ),
    );
  }
}
