import 'package:flutter/material.dart';
import 'package:news_print_app/constants/global_variable.dart';
import 'package:news_print_app/utils/widgets/custom_button.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpVerifyWidget extends StatelessWidget {
  const OtpVerifyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // String otpValue = "";

    void verifyOTP() {
      print("Varification is pending");
    }

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
                  // otpValue = value;
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
