import 'package:flutter/material.dart';
import 'package:news_print_app/constants/global_variable.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(
            color: GlobalVariables.primaryColor,
          ),
      ),
    );
  }
}
