import 'package:flutter/material.dart';
import 'package:news_print_app/widgets/filter_widget.dart';

class FilterNewsScroll extends StatelessWidget {
  const FilterNewsScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        FilterNews(filterText: "🌟 Featured"),
        FilterNews(filterText: "🎭 Culture"),
        FilterNews(filterText: "⚽️ Sports"),
        FilterNews(filterText: "📈️ Stocks"),
      ],
    );
  }
}
