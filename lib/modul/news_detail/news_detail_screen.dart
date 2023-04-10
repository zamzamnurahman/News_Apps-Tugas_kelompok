import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../models/news.dart';

class NewsDetailScreen extends StatelessWidget {
   NewsDetailScreen({super.key,this.news});
  News? news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Detail")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Image.network(news!.image!), 
            Text(news!.title!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            Text(news!.description!, textAlign: TextAlign.justify,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [IconButton(onPressed: (){}, icon: Icon(Icons.favorite, color: Colors.red,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.message_outlined, color: Colors.amber,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.send_sharp, color: Colors.black,))
            ],)
          ]),
        ),
      ),
    );
  }
}