import 'package:flutter/material.dart';
import 'package:gsb_workshop/components/UserForm.dart';
import 'package:gsb_workshop/models/HttpStatusMsg.dart';
import 'package:gsb_workshop/services/UserService.dart';

import '../../utils/AlertHelper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: UserForm(
        buttonLabel: 'Register',
        submit: _submit,
      ),
    );
  }

  _submit(String username, String password) async {
    UserService userService = UserService();
    HttpStatusMsg htm = await userService.register(username, password);
    if (htm.success) {
      AlertHelper.showBar(
        context: context,
        msg: 'Registered complete',
      );
      Navigator.pop(context);
    } else {
      AlertHelper.showBar(
        context: context,
        msg: htm.errorMsg!,
        isError: true,
      );
    }
  }
}
