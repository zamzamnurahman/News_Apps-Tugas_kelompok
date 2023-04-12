import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_apps/models/news.dart';
import '../news/news_screen.dart';
import '/data/news_data.dart';

class HotNewsWidget extends StatefulWidget {
  const HotNewsWidget({
    super.key,
  });

  @override
  State<HotNewsWidget> createState() => _HotNewsWidgetState();
}

class _HotNewsWidgetState extends State<HotNewsWidget> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text("Hot News"),
          trailing: IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text("News"),
                  ),
                  body: const NewsScreen(),
                );
              }));
            },
          ),
        ),
        SizedBox(
          height: 200,
          child: PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            children:
                hotNews.map((News news) => HotNewsCard(news: news)).toList(),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            hotNews.length,
            (index) => DotWidget(_pageIndex, index),
          ),
        )
      ],
    );
  }
}

class DotWidget extends StatelessWidget {
  int index;
  int itemIndex;
  DotWidget(
    this.index,
    this.itemIndex, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        radius: 5,
        backgroundColor: itemIndex == index ? Colors.black : Colors.grey,
      ),
    );
  }
}

class HotNewsCard extends StatelessWidget {
  News news;
  HotNewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).pushNamed(
          'news-detail',
          params: {
            'id': news.id.toString(),
          },
          extra: news,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              news.image!,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black])),
            child: ListTile(
              title: Text(
                news.title!,
                maxLines: 2,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              subtitle: Text(
                news.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
