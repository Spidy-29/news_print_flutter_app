import 'package:flutter/material.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 151,
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Image.asset(
                  "assets/images/modi.jpg",
                  fit: BoxFit.fill,
                  height: double.infinity,
                )),
          ),
          Expanded(
            flex: 2,
            child: Padding(
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
                    "Goldman is \"cooperating with and providing information to various governmental bodies\" on its activities for SVB in March just before the tech-oriented bank went under, ",
                    style: TextStyle(
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
                        "3 min Read  4:12 PM ",
                        style: TextStyle(
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
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: const Color(0xFFF0F0F0),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
