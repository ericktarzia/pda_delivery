import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pda_delivery/libs/configs.lib.dart';
import 'package:pda_delivery/views/home.view.dart';
import 'package:pda_delivery/views/login/login.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: nome_app,
      theme: ThemeData.light().copyWith(primaryColor: Colors.blue),
      darkTheme: ThemeData.dark(),
      // NOTE: Optional - use themeMode to specify the startup theme
     //themeMode: ThemeMode.dark,
      /*
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      */
      home: TelaLogin(),
    );
  }
}
