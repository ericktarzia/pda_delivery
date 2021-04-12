import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pda_delivery/libs/configs.lib.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(child: Text(nome_app)),
          ),
          
          ExpansionTile(
            title: Text("Tema"),
            children: <Widget>[
              ListTile(
                title: Text('Escuro'),
                onTap: () {
                  Get.changeTheme(ThemeData.dark());
                },
              ),
              ListTile(
                title: Text('Claro'),
                onTap: () {
                  Get.changeTheme(ThemeData.light());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
