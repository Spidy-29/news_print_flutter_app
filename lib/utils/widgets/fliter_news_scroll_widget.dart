import 'package:flutter/material.dart';
import 'package:news_print_app/utils/widgets/filter_widget.dart';

class FilterNewsScroll extends StatelessWidget {
  const FilterNewsScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 32,
        maxHeight: 32
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          FilterNews(filterText: "🌟 Featured"),
          FilterNews(filterText: "🎭 Culture"),
          FilterNews(filterText: "⚽️ Sports"),
          FilterNews(filterText: "📈️ Stocks"),
        ],
      ),
    );
  }
}
