import 'package:flutter/material.dart';

class RecommendedNewsCard extends StatelessWidget {
  const RecommendedNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFF0F0F0)),
      ),
      elevation: 2.0,
      color: Colors.white,
      child: Container(
        width: 200,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                "assets/images/modi.jpg",
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Goldman Sachs Being Probed Over Silicon Valley Bank Collapse",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      "Goldman is \"cooperating with and providing information to various governmental bodies\" on its activities for SVB in March just before the tech-oriented bank went under, according to the filing.",
                      style: TextStyle(
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
                              child: Image.asset(
                                "assets/images/economic_times_logo.png",
                              ),
                              borderRadius: BorderRadius.circular(4),
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
