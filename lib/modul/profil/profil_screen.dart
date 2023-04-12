import 'package:flutter/material.dart';
import '/models/user.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    super.key,
    this.user,
  });
  User? user;

  @override
  State<ProfileScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController? _nameCtrl;
  TextEditingController? _emailCtrl;
  TextEditingController? _usernameCtrl;

  @override
  void initState() {
    _nameCtrl = TextEditingController(text: widget.user!.name);
    _usernameCtrl = TextEditingController(text: widget.user!.userName);
    _emailCtrl = TextEditingController(text: widget.user!.email);
    super.initState();
  }

  @override
  void dispose() {
    _nameCtrl!.dispose();
    _emailCtrl!.dispose();
    _usernameCtrl!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Profile screen"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(widget.user!.profileImage!),
                    ),
                  ),
                  Form(
                      key: _globalKey,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: TextFormField(
                                    controller: _nameCtrl,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'silahkan isi nama lengkap';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Nama Lengkap',
                                      label: Text("Nama Lengkap"),
                                      filled: true,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Flexible(
                                  child: TextFormField(
                                    initialValue: "${widget.user!.id}",
                                    enabled: false,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                      hintText: 'Id',
                                      label: Text("ID"),
                                      filled: true,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _usernameCtrl,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'isi username';
                                } else if (value.length > 8 ||
                                    value.length < 3) {
                                  return "min. 3-8 huruf";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Username',
                                label: Text("Username"),
                                filled: true,
                                border: InputBorder.none,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _emailCtrl,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'silahkan isi email';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Alamat Email',
                                label: Text("Alamat Email"),
                                filled: true,
                                border: InputBorder.none,
                              ),
                            )
                          ],
                        ),
                      )),
                ])),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Profile Berhasil di simpan!")));
                  }
                },
                child: const Text('simpan perubahan'),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }
}
