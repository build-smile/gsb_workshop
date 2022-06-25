import 'package:flutter/material.dart';
import 'package:gsb_workshop/components/UserForm.dart';
import 'package:gsb_workshop/models/HttpStatusMsg.dart';
import 'package:gsb_workshop/services/UserService.dart';
import 'package:gsb_workshop/utils/AlertHelper.dart';
import 'package:gsb_workshop/utils/LoadingProgress.dart';
import 'package:gsb_workshop/utils/LocalStorage.dart';

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
    LoadingProgress.inProgress(() async {
      UserService userService = UserService();
      HttpStatusMsg htm =
          await userService.login(username: username, password: password);
      if (htm.success) {
        LocalStorage localStorage = LocalStorage();
        localStorage.storeToken('${htm.result}');
        AlertHelper.showBar(context: context, msg: 'Welcome to Inventory App');
      } else {
        AlertHelper.showBar(
            context: context, msg: htm.errorMsg!, isError: true);
      }
    });
  }
}
