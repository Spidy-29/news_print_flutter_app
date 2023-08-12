import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_print_app/screens/home_screens/screens/bookmarks_screen.dart';
import 'package:news_print_app/screens/home_screens/screens/for_you_screen.dart';
import 'package:news_print_app/screens/home_screens/screens/newspaper_screen.dart';
import 'package:news_print_app/screens/onboarding/screens/onboarding_screen.dart';
import 'package:news_print_app/screens/home_screens/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> listPage = [
    const ForYouScreen(),
    const NewsPaperScreen(),
    const BookmarksScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    // final scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            listPage[index],
            Container(
              alignment: Alignment.bottomCenter,
              child: FloatingNavbar(
                borderRadius: 100,
                itemBorderRadius: 100,
                selectedBackgroundColor: const Color(0xFF005EEC),
                selectedItemColor: Colors.white,
                backgroundColor: Colors.white,
                unselectedItemColor: Colors.brown.shade600,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                items: [
                  FloatingNavbarItem(
                    // icon: Icons.child_care,
                    title: "For You",
                    customWidget:
                        SvgPicture.asset('assets/images/ic_for_you.svg'),
                  ),
                  FloatingNavbarItem(
                    // icon: Icons.bookmark,
                    title: "NewsPaper",
                    customWidget:
                        SvgPicture.asset('assets/images/ic_news_paper.svg'),
                  ),
                  FloatingNavbarItem(
                    // icon: Icons.document_scanner_sharp,
                    title: "Bookmark",
                    customWidget:
                        SvgPicture.asset('assets/images/ic_bookmark.svg'),
                  ),
                  FloatingNavbarItem(
                    // icon: Icons.person_3_rounded,
                    title: "Profile",
                    customWidget: Image.asset('assets/images/ic_profile.png'),
                  ),
                ],
                currentIndex: index,
                onTap: (val) {
                  if (val == 3) {
                    FirebaseAuth.instance.signOut();
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushNamed(context, OnboardingScreen.routeName);
                  }
                  setState(() {
                    index = val;
                  });
                },
              ),
              // child: const DemoNavBar(),
            ),
          ],
        ),
        // bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
