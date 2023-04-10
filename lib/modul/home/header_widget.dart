import 'package:flutter/material.dart';
import 'package:navigator_apps/modul/profil/profil_screen.dart';

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
      title:
          const Text("Hallo, Selamat Datang", style: TextStyle(fontSize: 12)),
      subtitle: Text(data.user.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          )),
      trailing: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfileScreen(user: data.user)));
        },
        child: CircleAvatar(
          foregroundImage: NetworkImage(data.user.profileImage!),
        ),
      ),
    );
  }
}
