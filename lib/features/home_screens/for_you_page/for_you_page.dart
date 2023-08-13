import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_print_app/features/home_screens/for_you_page/widgets/recommeded_news_widget.dart';
import 'package:news_print_app/features/home_screens/for_you_page/widgets/trending_news_widget.dart';
import 'package:news_print_app/utils/widgets/custom_appbar_widget.dart';
import 'package:news_print_app/utils/widgets/fliter_news_scroll_widget.dart';

class ForYouPage extends StatelessWidget {
  const ForYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
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
          ],
        ),
      ),
    );
  }
}
