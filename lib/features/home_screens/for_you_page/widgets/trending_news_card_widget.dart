import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class TrendingNewsCard extends StatelessWidget {
  final String articleImageUrl,
      articleTitle,
      articleDescription,
      sourceName,
      publishTime;
  const TrendingNewsCard({
    super.key,
    required this.articleImageUrl,
    required this.articleTitle,
    required this.articleDescription,
    required this.sourceName,
    required this.publishTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      color: Colors.white,
      elevation: 2.0,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFF0F0F0)),
      ),
      child: SizedBox(
        height: 151,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.network(
                    articleImageUrl,
                    fit: BoxFit.fill,
                    height: double.infinity,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Image.asset(
                        "assets/images/modi.jpg",
                        fit: BoxFit.fill,
                        height: double.infinity,
                      );
                    },
                  )),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      articleTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      articleDescription,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                "assets/images/economic_times_logo.png",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3),
                              child: Text(
                                sourceName,
                                style: const TextStyle(
                                  color: Color(0xFF828282),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          DateFormat('dd-MM-yyyy h:mm a')
                              .format(DateTime.parse(publishTime).toLocal()),
                          style: const TextStyle(
                            color: Color(0xFF828282),
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
