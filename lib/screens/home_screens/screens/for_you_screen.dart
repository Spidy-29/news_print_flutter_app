import 'package:flutter/material.dart';
import 'package:news_print_app/utils/widgets/custom_appbar_widget.dart';
import 'package:news_print_app/utils/widgets/fliter_news_scroll_widget.dart';
import 'package:news_print_app/screens/home_screens/widgets/recommeded_news_widget.dart';
import 'package:news_print_app/screens/home_screens/widgets/trending_news_widget.dart';

class ForYouScreen extends StatelessWidget {
  const ForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
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
    );
  }
}
