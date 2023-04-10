import 'package:flutter/material.dart';
import 'package:navigator_apps/models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.user,
  });
  final User user;

  @override
  State<ProfileScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile screen"),
      ),
      body: Center(child: Text("profile Detail Screen")),
    );
  }
}
