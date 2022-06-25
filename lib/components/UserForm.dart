import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final String buttonLabel;
  final Function submit;
  const UserForm({Key? key, required this.buttonLabel, required this.submit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _keyForm = GlobalKey<FormState>();
    return Container(
      child: Form(
        key: _keyForm,
        child: Column(
          children: [
            ListTile(
              title: TextFormField(
                validator: _validateString,
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),
            ListTile(
              title: TextFormField(
                validator: _validateString,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
            ),
            ListTile(
              title: ElevatedButton(
                child: Text(buttonLabel),
                onPressed: () {
                  if (_keyForm.currentState!.validate()) {}
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  String? _validateString(String? value) {
    if (value == null || value.isEmpty) {
      return 'Pleas fill data';
    }
    return null;
  }
}
