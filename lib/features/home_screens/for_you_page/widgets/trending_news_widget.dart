import 'package:flutter/material.dart';
import 'package:news_print_app/models/article_object.dart';

import 'trending_news_card_widget.dart';

class TrendingNews extends StatelessWidget {
  final List<ArticleObject> articles;
  const TrendingNews({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView.builder(
        itemBuilder: (context, index) => TrendingNewsCard(
          articleImageUrl: articles[index].urlToImage,
          articleTitle: articles[index].title,
          articleDescription: articles[index].description,
          sourceName: articles[index].source?.name ?? "unknown",
          publishTime: articles[index].publishedAt,
        ),
        itemCount: articles.length,
      ),

      /*ListView(
        children: const [
          TrendingNewsCard(),
          TrendingNewsCard(),
          TrendingNewsCard(),
          TrendingNewsCard(),
        ],
      ),*/
    );
  }
}
