import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/news.dart';

class NewsDetailScreen extends StatefulWidget {
  NewsDetailScreen({super.key, this.news});
  News? news;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  int likes = 0;
  int comment = 0;
  int send = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("News Detail")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(children: [
            AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  widget.news!.image!,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
              child: Text(
                widget.news!.title!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Text(
              widget.news!.description!,
              textAlign: TextAlign.justify,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            likes++;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )),
                    Text(likes.toString())
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            comment++;
                          });
                        },
                        icon: Icon(
                          Icons.message_outlined,
                          color: Colors.amber,
                        )),
                    Text(comment.toString()),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            send++;
                          });
                        },
                        icon: Icon(
                          Icons.send_sharp,
                          color: Colors.black,
                        )),
                    Text(send.toString())
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
