import 'package:flutter/material.dart';
import '/data/news_data.dart';
import '/models/news.dart';
import '/widget/news_item_widget.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(title: Text("News Article List")),
        Column(
          children:
              newsData.map((News news) => NewsItemWidget(news: news)).toList(),
        )
      ],
    );
  }
}
