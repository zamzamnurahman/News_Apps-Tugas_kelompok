import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile screen"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(widget.user.profileImage!),
                    ),
                    Form(
                        key: _globalKey,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'silahkan isi nama lengkap';
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(hintText: 'Nama Lengkap'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'silahkan isi email';
                                  }
                                  return null;
                                },
                                decoration:
                                    InputDecoration(hintText: 'Alamat Email'),
                              )
                            ],
                          ),
                        )),
                  ]),
            )),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    if (!_globalKey.currentState!.validate()) {}
                  },
                  child: Text('simpan perubahan')),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
