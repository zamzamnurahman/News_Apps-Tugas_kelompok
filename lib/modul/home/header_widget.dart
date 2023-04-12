import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_apps/models/user.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    super.key,
    required this.data,
  });

  User data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:
          const Text("Hallo, Selamat Datang", style: TextStyle(fontSize: 12)),
      subtitle: Text(data.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          )),
      trailing: GestureDetector(
        onTap: () {
          GoRouter.of(context).pushNamed("profile", extra: data);
        },
        child: CircleAvatar(
          foregroundImage: NetworkImage(data.profileImage!),
        ),
      ),
    );
  }
}
