import 'package:flutter/material.dart';

import 'home_screen.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.data,
  });

  final HomeScreen data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Hi, Selamat Datang", style: TextStyle(fontSize: 12)),
      subtitle: Text(data.user.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          )),
      trailing: CircleAvatar(
        foregroundImage: NetworkImage(data.user.profileImage!),
      ),
    );
  }
}
