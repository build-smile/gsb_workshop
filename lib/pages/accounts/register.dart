import 'package:flutter/material.dart';
import 'package:gsb_workshop/components/UserForm.dart';

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

  _submit() {}
}
