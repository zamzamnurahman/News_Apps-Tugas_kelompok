import 'package:flutter/material.dart';
import 'package:news_apps/modul/home/header_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const DrawerHeader(
          child: Text("Menu Option",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
        ),
        Card(
          child: ListTile(
            onTap: () {},
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
          ),
        ),
        Card(
          child: ListTile(
            onTap: () {},
            leading: const Icon(Icons.newspaper),
            title: const Text("News"),
          ),
        ),
        Card(
          child: ListTile(
            onTap: () {},
            leading: const Icon(Icons.settings),
            title: const Text("Setting"),
          ),
        ),
        Card(
          child: ListTile(
            onTap: () {},
            tileColor: Colors.red,
            textColor: Colors.white,
            iconColor: Colors.white,
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
          ),
        ),
      ],
    );
  }
}
