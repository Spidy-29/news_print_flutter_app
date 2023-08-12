import 'package:flutter/material.dart';
import 'package:news_print_app/utils/widgets/filter_widget.dart';

class FilterNewsScroll extends StatelessWidget {
  const FilterNewsScroll({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      "🌟 Featured",
      "🎭 Culture",
      "⚽️ Sports",
      "📈️ Stocks",
    ];

    return Container(
      constraints: const BoxConstraints(minHeight: 32, maxHeight: 32),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return FilterNews(
            filterText: list[index],
          );
        },
      ),
    );
  }
}
