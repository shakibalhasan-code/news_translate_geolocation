import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:soft_news_ai/core/models/news_model.dart';

class HomeState extends GetxController {
  var isLoading = false.obs;
  var newsList = <NewsArticle>[].obs;

  static const String apiKey = '0ab0a1c7b13a40d1a5af396fe5d9f951';
  static const String baseUrl = 'https://newsapi.org/v2/everything';

  Future<void> getCountryTodayTopNews(String query) async {
    final today = DateTime.now().toString().split(' ')[0];

    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=bangladesh&from=2024-11-21&sortBy=publishedAt&apiKey=0ab0a1c7b13a40d1a5af396fe5d9f951');

    try {
      isLoading.value = true;
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['articles'] != null) {
          newsList.value = (data['articles'] as List)
              .map((article) => NewsArticle.fromJson(article))
              .toList();
        } else {
          Get.snackbar('Error', 'No news articles found.');
        }
      } else {
        final error = jsonDecode(response.body);
        Get.snackbar('Error', 'Failed to fetch news: ${error['message']}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
