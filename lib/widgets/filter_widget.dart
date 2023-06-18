import 'package:flutter/material.dart';

class FilterNews extends StatelessWidget {
  final String filterText;
  const FilterNews({super.key, required this.filterText});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 32,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 7,
        ),
        child: Text(
          filterText,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFF222222),
          ),
        ),
      ),
    );
  }
}
