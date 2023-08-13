import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_print_app/features/home_screens/bookmark_page/bookmark_page.dart';
import 'package:news_print_app/features/home_screens/for_you_page/for_you_page.dart';
import 'package:news_print_app/features/home_screens/news_paper_page/news_paper_page.dart';
import 'package:news_print_app/features/home_screens/profile_page/profile_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  static const String routeName = 'bottom-navbar';
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _page = 0;

  List<Widget> pages = [
    const ForYouPage(),
    const NewsPaperPage(),
    const BookmarkPage
    (),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[_page],
        bottomNavigationBar: FloatingNavbar(
          borderRadius: 100,
          itemBorderRadius: 100,
          selectedBackgroundColor: const Color(0xFF005EEC),
          selectedItemColor: Colors.white,
          backgroundColor: Colors.white.withAlpha(0),
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
              title: "Profile",
              customWidget: SvgPicture.asset('assets/images/ic_profile.svg'),
            ),
          ],
          currentIndex: _page,
          onTap: (val) {
            setState(() {
              // if (val == 2) {
              //   FirebaseAuth.instance.signOut();
              //   Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
              // }
              _page = val;
            });
          },
        ),
      ),
    );
  }
}
