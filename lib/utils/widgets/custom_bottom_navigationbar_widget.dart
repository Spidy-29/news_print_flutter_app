import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_print_app/screens/onboarding_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
      borderRadius: 100,
      itemBorderRadius: 100,
      selectedBackgroundColor: const Color(0xFF005EEC),
      selectedItemColor: Colors.white,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.brown.shade600,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      items: [
        FloatingNavbarItem(
          // icon: Icons.child_care,
          title: "For You",
          customWidget: SvgPicture.asset('assets/images/ic_for_you.svg'),
        ),
        FloatingNavbarItem(
          // icon: Icons.bookmark,
          title: "NewsPaper",
          customWidget: SvgPicture.asset('assets/images/ic_news_paper.svg'),
        ),
        FloatingNavbarItem(
          // icon: Icons.document_scanner_sharp,
          title: "Bookmark",
          customWidget: SvgPicture.asset('assets/images/ic_bookmark.svg'),
        ),
        FloatingNavbarItem(
          // icon: Icons.person_3_rounded,
          title: "LogOut",
          customWidget: Image.asset('assets/images/ic_profile.png'),
        ),
      ],
      currentIndex: index,
      onTap: (val) {
        setState(() {
          if (val == 3) {
            FirebaseAuth.instance.signOut();
            Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
          }
          index = val;
        });
      },
    );

    // ScrollBottomNavigationBar(
    //   controller: scrollController,
    //   items: const [
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.child_care),
    //       label: "For You",
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.bookmark),
    //       label: "",
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.document_scanner_sharp),
    //       label: "For You",
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.person_3_rounded),
    //       label: "For You",
    //     ),
    //   ],
    //   currentIndex: 0,
    // );
  }
}
