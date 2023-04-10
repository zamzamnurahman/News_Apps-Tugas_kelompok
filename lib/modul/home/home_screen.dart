import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:navigator_apps/modul/menu/menu_screen.dart';
import 'package:navigator_apps/modul/profile/profile_screen.dart';

import '../../models/user.dart';
import 'header_widget.dart';
import 'hotnews_widget.dart';
import 'lates_news_widget.dart';
import 'searchbar_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.user});

  User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();
  int _tabIndex = 0;
  _selectedTabIndex(int value) {
    setState(() {
      _tabIndex = value;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      log(_scrollController.offset.toString());
      print(_scrollController.offset.toString());
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        print("Get data terbaru");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: Drawer(
        width: size.width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(color: Colors.grey[400]),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      foregroundImage: NetworkImage(widget.user.profileImage!),
                    ),
                    Text(widget.user.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(widget.user.email),
                  ],
                )),
            Card(
              child: ListTile(
                onTap: () {},
                leading: Icon(Icons.person),
                title: Text("Profile"),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _tabIndex,
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  HeaderWidget(data: widget),
                  const SearchbarWidget(),
                  const HotNewsWidget(),
                  const LatesNewsWidget()
                ],
              ),
            ),
            const MenuScreen(),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  BottomNavigationBar bottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _tabIndex,
      onTap: _selectedTabIndex,
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "News",
          icon: Icon(Icons.newspaper),
        ),
        BottomNavigationBarItem(
          label: "Menu",
          icon: Icon(Icons.menu),
        )
      ],
    );
  }
}
