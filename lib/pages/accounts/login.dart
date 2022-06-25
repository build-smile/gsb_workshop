import 'package:flutter/material.dart';
import 'package:gsb_workshop/components/UserForm.dart';
import 'package:gsb_workshop/services/UserService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.all(30),
            child: Image.asset('assets/images/Inventory.png'),
          ),
          Container(
            child: UserForm(
              buttonLabel: 'Login',
              submit: _submit,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Register'))
        ],
      ),
    );
  }

  _submit(String username, String password) async {
    UserService userService = UserService();
    await userService.login(username: username, password: password);
  }
}
