import 'package:flutter/material.dart';
import 'package:gsb_workshop/utils/LocalStorage.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _logout,
          child: Text('Log out'),
        ),
      ),
    );
  }

  _logout() async {
    LocalStorage localStorage = LocalStorage();
    localStorage.removeToken();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
