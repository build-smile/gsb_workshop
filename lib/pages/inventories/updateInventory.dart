import 'package:flutter/material.dart';
import 'package:gsb_workshop/components/StockForm.dart';
import 'package:gsb_workshop/models/Inventory.dart';

class UpdateInventory extends StatefulWidget {
  const UpdateInventory({Key? key}) : super(key: key);

  @override
  State<UpdateInventory> createState() => _UpdateInventoryState();
}

class _UpdateInventoryState extends State<UpdateInventory> {
  @override
  Widget build(BuildContext context) {
    Inventory inv = ModalRoute.of(context)!.settings.arguments as Inventory;
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Inventory'),
      ),
      body: Column(
        children: [
          StockForm(
            buttonLabel: 'Update',
            inv: inv,
            submit: _submit,
          ),
          TextButton(onPressed: () {}, child: Text('remove'))
        ],
      ),
    );
  }

  _submit(Inventory inv) {}
}
