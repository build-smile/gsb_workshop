import 'package:flutter/material.dart';
import 'package:gsb_workshop/components/StockForm.dart';
import 'package:gsb_workshop/models/HttpStatusMsg.dart';
import 'package:gsb_workshop/models/Inventory.dart';
import 'package:gsb_workshop/services/InventoryService.dart';
import 'package:gsb_workshop/utils/AlertHelper.dart';
import 'package:gsb_workshop/utils/LoadingProgress.dart';

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

  _submit(Inventory inv) {
    LoadingProgress.inProgress(() async {
      InventoryService inventoryService = InventoryService();
      HttpStatusMsg htm = await inventoryService.update(inv);
      if (htm.success) {
        AlertHelper.showBar(context: context, msg: 'Update Complete');
        Navigator.pop(context);
      } else {
        AlertHelper.showBar(
            context: context, msg: htm.errorMsg!, isError: true);
      }
    });
  }
}
