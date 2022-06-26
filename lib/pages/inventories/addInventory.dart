import 'package:flutter/material.dart';
import 'package:gsb_workshop/components/StockForm.dart';
import 'package:gsb_workshop/models/HttpStatusMsg.dart';
import 'package:gsb_workshop/models/Inventory.dart';
import 'package:gsb_workshop/services/InventoryService.dart';
import 'package:gsb_workshop/utils/AlertHelper.dart';
import 'package:gsb_workshop/utils/LoadingProgress.dart';

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

  _submit(Inventory inv) {
    LoadingProgress.inProgress(() async {
      InventoryService inventoryService = InventoryService();
      HttpStatusMsg htm = await inventoryService.insert(inv);
      if (htm.success) {
        AlertHelper.showBar(context: context, msg: 'Insert complete');
        Navigator.pop(context);
      } else {
        AlertHelper.showBar(
            context: context, msg: htm.errorMsg!, isError: true);
      }
    });
    //print('name: ${inv.description} stock:${inv.stock} price: ${inv.price}');
  }
}
