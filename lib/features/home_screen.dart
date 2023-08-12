import 'package:flutter/material.dart';
import 'package:news_print_app/screens/home_screens/widgets/recommeded_news_widget.dart';
import 'package:news_print_app/screens/home_screens/widgets/trending_news_widget.dart';

import '../utils/widgets/custom_appbar_widget.dart';
import '../utils/widgets/custom_bottom_navigationbar_widget.dart';
import '../utils/widgets/fliter_news_scroll_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final scrollController = ScrollController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  FilterNewsScroll(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "🗞️ Recommended",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  RecommendedNews(),
                  SizedBox(
                    height: 26,
                  ),
                  Text(
                    "🔥 Trending",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TrendingNews(),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: const CustomBottomNavigationBar(),
              // child: const DemoNavBar(),
            ),
          ],
        ),
        // bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
