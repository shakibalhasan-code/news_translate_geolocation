import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:soft_news_ai/core/state/home_state.dart';
import 'package:soft_news_ai/views/screens/home/items/news_item.dart';
import 'package:soft_news_ai/views/widgets/custom_button.dart';
import 'package:soft_news_ai/views/widgets/gradiunt_widget.dart';

import 'items/vertical_news_item.dart';

class HomeScreen extends StatefulWidget {
  final countryCode;
  const HomeScreen({super.key, this.countryCode});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeState homeState = Get.put(HomeState());

  @override
  void initState() {
    super.initState();
    homeState.getCountryTodayTopNews(widget.countryCode);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ParentGradiuntWidget(
        child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Populer News',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 15, color: Colors.white),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            height: height * 0.3,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeState.newsList.length,
                itemBuilder: (context, index) {
                  final article = homeState.newsList[index];
                  return HorizentalNewsItem(
                    newsArticle: article,
                  );
                }),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Recent News',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 15, color: Colors.white),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: homeState.newsList.length,
                itemBuilder: (context, index) {
                  final article = homeState.newsList[index];

                  return VerticalNewsItem(
                    newsArticle: article,
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
