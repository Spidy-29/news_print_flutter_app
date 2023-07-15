import 'package:flutter/material.dart';
import 'package:news_print_app/constants/global_variable.dart';

class IconWithText extends StatelessWidget {
  final String txt;
  final double txtSize;
  final Color txtColor;
  final Widget imageWidget;
  const IconWithText({
    super.key,
    required this.txt,
    this.txtSize = 14,
    this.txtColor = GlobalVariables.textColor,
    required this.imageWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: imageWidget,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          txt,
          style: TextStyle(
            fontSize: txtSize,
            color: txtColor,
          ),
        ),
      ],
    );
  }
}
