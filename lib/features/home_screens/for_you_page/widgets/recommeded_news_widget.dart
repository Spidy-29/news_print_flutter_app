import 'package:flutter/material.dart';
import 'package:news_print_app/features/home_screens/for_you_page/widgets/recommended_news_card_widget.dart';

class RecommendedNews extends StatelessWidget {
  const RecommendedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
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
    );
  }
}
