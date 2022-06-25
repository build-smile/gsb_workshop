import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final String buttonLabel;
  final Function submit;
  const UserForm({Key? key, required this.buttonLabel, required this.submit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            ListTile(
              title: TextFormField(),
            ),
            ListTile(
              title: TextFormField(),
            ),
            ListTile(
              title: ElevatedButton(
                child: Text(buttonLabel),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
