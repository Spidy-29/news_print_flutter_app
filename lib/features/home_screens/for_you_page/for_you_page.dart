import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_print_app/constants/global_variable.dart';
import 'package:news_print_app/constants/http_status_code_handle.dart';
import 'package:news_print_app/features/home_screens/for_you_page/widgets/recommeded_news_widget.dart';
import 'package:news_print_app/features/home_screens/for_you_page/widgets/trending_news_widget.dart';
import 'package:news_print_app/models/article_object.dart';
import 'package:news_print_app/utils/widgets/custom_appbar_widget.dart';
import 'package:news_print_app/utils/widgets/fliter_news_scroll_widget.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ForYouPage extends StatefulWidget {
  const ForYouPage({super.key});

  @override
  State<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> {
  List<ArticleObject>? articleList;

  callApi() async {
    // String? baseUri = DotEnv().env['BASE_URL_TOP_HEADLINE'];

    Map<String, String?> params = {
      'country': 'in',
      'apikey': dotenv.env['API_KEY'],
      'category': 'sports',
      'pageSize': '10',
      'page': '0',
    };

    Uri uri = Uri(
        queryParameters: params,
        scheme: 'https',
        host: 'newsapi.org',
        path: '/v2/top-headlines');

    http.Response response = await http.get(uri);

    httpStatusCodeHandle(
      response: response,
      context: context,
      onSuccess: () {
        var resList = jsonDecode(response.body)['articles'] as List;
        articleList =
            resList.map((article) => ArticleObject.fromMap(article)).toList();
        print(articleList!.length);
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
    callApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: articleList == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: GlobalVariables.primaryColor,
                ),
              )
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomAppBar(),
                        const FilterNewsScroll(),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "🗞️ Recommended",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        RecommendedNews(
                          articles: articleList!,
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        const Text(
                          "🔥 Trending",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TrendingNews(articles: articleList!),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
