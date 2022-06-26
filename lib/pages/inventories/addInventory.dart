import 'package:flutter/material.dart';
import 'package:gsb_workshop/components/StockForm.dart';
import 'package:gsb_workshop/models/Inventory.dart';

class AddInventoryScreen extends StatefulWidget {
  const AddInventoryScreen({Key? key}) : super(key: key);

  @override
  State<AddInventoryScreen> createState() => _AddInventoryScreenState();
}

class _AddInventoryScreenState extends State<AddInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Inventory'),
      ),
      body: StockForm(
        inv: Inventory(),
        submit: _submit,
        buttonLabel: 'Submit',
      ),
    );
  }

  _submit() {}
}
