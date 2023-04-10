import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:navigator_apps/data/news_data.dart';
import 'package:navigator_apps/models/news.dart';
import 'package:navigator_apps/widget/news_item_widget.dart';

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
