import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color bgColor;
  final Color textColor;
  final double txtSize;
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.bgColor = const Color(0xFFE85748),
    this.textColor = Colors.white,
    this.txtSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.0,
        margin: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: txtSize,
            ),
          ),
        ),
      ),
    );
  }
}
