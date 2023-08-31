import 'package:flutter/material.dart';
import 'package:news_print_app/features/home_screens/for_you_page/widgets/recommended_news_card_widget.dart';
import 'package:news_print_app/models/article_object.dart';

class RecommendedNews extends StatelessWidget {
  final List<ArticleObject> articles;
  const RecommendedNews({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView.builder(
        itemBuilder: (context, index) => RecommendedNewsCard(
            imageUrl: articles[index].urlToImage,
            articleTitle: articles[index].title,
            articleDescription: articles[index].description),
        itemCount: articles.length,
        scrollDirection: Axis.horizontal,
      ),

      //   ListView(
      // scrollDirection: Axis.horizontal,
      // children: const [
      //   RecommendedNewsCard(
      //     articleDescription: "Des",
      //     articleTitle: "Ttit",
      //     imageUrl:
      //         "https://images.unsplash.com/photo-1594409855476-29909f35c73c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80",
      //   ),
      // RecommendedNewsCard(),
      // RecommendedNewsCard(),
      // RecommendedNewsCard(),
      // RecommendedNewsCard(),
      //   ],
      // ),
    );
  }
}
