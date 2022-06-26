import 'package:flutter/material.dart';
import 'package:gsb_workshop/models/Inventory.dart';
import 'package:gsb_workshop/services/InventoryService.dart';
import 'package:intl/intl.dart';

class InventoryListScreen extends StatefulWidget {
  const InventoryListScreen({Key? key}) : super(key: key);

  @override
  State<InventoryListScreen> createState() => _InventoryListScreenState();
}

class _InventoryListScreenState extends State<InventoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: InventoryService().getAll(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Inventory?>?> snapshot) {
          if (snapshot.hasData) {
            List<Inventory?> inventories = snapshot.data!;
            return ListView.builder(
              itemCount: inventories.length,
              itemBuilder: (BuildContext context, int i) {
                Inventory inv = inventories[i]!;
                var f = NumberFormat("#,##0.00");
                var d = DateFormat.yMMMEd();
                String price = f.format(inv.price);
                String updatedDate = d.format(inv.updatedDate!);
                return ListTile(
                  leading: Icon(Icons.ad_units),
                  title: Text(inv.description),
                  subtitle: Text(updatedDate),
                  trailing: Text('$price Baht'),
                  onTap: () {
                    Navigator.pushNamed(context, '/edit', arguments: inv)
                        .then((value) => setState(() {}));
                  },
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add').then((value) => setState(() {}));
        },
      ),
    );
  }
}
