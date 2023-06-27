import 'package:flutter/material.dart';

import 'trending_news_card_widget.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView(
        children: const [
          TrendingNewsCard(),
          TrendingNewsCard(),
          TrendingNewsCard(),
          TrendingNewsCard(),
        ],
      ),
    );
  }
}
