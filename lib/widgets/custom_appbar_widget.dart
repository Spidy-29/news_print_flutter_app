import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFF2F2F2),
        child: Image.asset("assets/images/user_pic.png"),
      ),
      // leading: Image.asset("assets/images/user_pic.png",),
      title: const Text(
        "👋🏻 Welcome,",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF4F4F4F),
        ),
      ),
      subtitle: const Text(
        "Dhrumil Mevada",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color(0xFF222222),
        ),
      ),
      trailing: CircleAvatar(
        backgroundColor: const Color(0xFFF2F2F2),
        child: SvgPicture.asset("assets/images/search_icon.svg"),
      ),
    );
  }
}
