import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/news.dart';

class NewsDetailScreen extends StatelessWidget {
   NewsDetailScreen({super.key,this.news});
  News? news;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}