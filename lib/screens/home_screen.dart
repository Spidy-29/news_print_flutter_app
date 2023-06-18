import 'package:flutter/material.dart';
import 'package:news_print_app/widgets/recommended_news_card_widget.dart';

import '../widgets/custom_appbar_widget.dart';
import '../widgets/fliter_news_scroll_widget.dart';
import '../widgets/trending_news_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: FilterNewsScroll(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 14),
              child: Text(
                "🗞️ Recommended",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  RecommendedNewsCard(),
                  RecommendedNewsCard(),
                  RecommendedNewsCard(),
                  RecommendedNewsCard(),
                  RecommendedNewsCard(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 26,
              ),
              child: Text(
                "🔥 Trending",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView(
                children: const [
                  TrendingNews(),
                  TrendingNews(),
                  TrendingNews(),
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
