import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color bgColor;
  final Widget txtWidget;
  final double topMargin, bottomMargin, leftMargin, rightMargin;
  const CustomButton({
    super.key,
    required this.onTap,
    this.bgColor = const Color(0xFFE85748),
    required this.txtWidget,
    this.topMargin = 0,
    this.bottomMargin = 0,
    this.leftMargin = 0,
    this.rightMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxHeight: 50.0),
      margin: EdgeInsets.only(
        top: topMargin,
        bottom: bottomMargin,
        left: leftMargin,
        right: rightMargin,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 1.0,
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: txtWidget,
      ),
    );
  }
}
