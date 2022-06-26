import 'package:flutter/material.dart';
import 'package:gsb_workshop/home.dart';
import 'package:gsb_workshop/pages/accounts/login.dart';
import 'package:gsb_workshop/pages/accounts/register.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gsb_workshop/pages/inventories/addInventory.dart';
import 'package:gsb_workshop/utils/LocalStorage.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  Intl.defaultLocale = 'th';
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/add': (context) => AddInventoryScreen()
      },
      home: FutureBuilder(
        future: LocalStorage().getToken(),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          }
          return LoginScreen();
        },
      ),
      builder: EasyLoading.init(),
    );
  }
}
