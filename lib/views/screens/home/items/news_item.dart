import 'package:flutter/material.dart';
import 'package:soft_news_ai/core/models/news_model.dart';

class HorizentalNewsItem extends StatelessWidget {
  final NewsArticle newsArticle;
  const HorizentalNewsItem({super.key, required this.newsArticle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(newsArticle.urlToImage ??
                'https://images.unsplash.com/photo-1634210000000-0b1b3b3b3b3b'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black, Colors.transparent],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsArticle.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 15, color: Colors.white),
                  textAlign: TextAlign.start,
                ),
                Text(
                  newsArticle.author ?? 'Unknown',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
