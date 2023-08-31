import 'package:flutter/material.dart';

class RecommendedNewsCard extends StatelessWidget {
  final String imageUrl;
  final String articleDescription;
  final String articleTitle;
  const RecommendedNewsCard({
    super.key,
    required this.imageUrl,
    required this.articleTitle,
    required this.articleDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFF0F0F0)),
      ),
      elevation: 2.0,
      color: Colors.white,
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 110),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    imageUrl,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        // image fully loaded
                        return child;
                      }
                      return Image.asset(
                        "assets/images/modi.jpg",
                        fit: BoxFit.cover,
                      );
                    },
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )

                  /*Image.asset(
                  "assets/images/modi.jpg",
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),*/
                  ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      articleTitle,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      articleDescription,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 8,
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
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3),
                              child: Text(
                                "Economic times",
                                style: TextStyle(
                                  color: Color(0xFF828282),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "4:12 PM",
                          style: TextStyle(
                            color: Color(0xFF828282),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
