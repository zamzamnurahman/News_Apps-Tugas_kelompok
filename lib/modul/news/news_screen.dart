import 'package:flutter/material.dart';
import '/data/news_data.dart';
import '/models/news.dart';
import '/widget/news_item_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const ListTile(
            title: Text("News Article List",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
        Column(
          children:
              newsData.map((News news) => NewsItemWidget(news: news)).toList(),
        )
      ],
    );
  }
}
