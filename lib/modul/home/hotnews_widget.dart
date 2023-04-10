import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigator_apps/data/news_data.dart';

class HotNewsWidget extends StatelessWidget {
  const HotNewsWidget({
    super.key,
  });

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
            onPressed: () {},
          ),
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).pushNamed(
              'news-detail',
              params: {
                'id': hotNews[0].id.toString(),
              },
              extra: hotNews[0],
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
                  hotNews[0].image!,
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
                    hotNews[0].title!,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  subtitle: Text(
                    hotNews[0].description!,
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
        )
      ],
    );
  }
}
