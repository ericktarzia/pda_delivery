import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FabCarrinho extends StatelessWidget {
  var c = 0.obs;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.shopping_cart),
      onPressed: () => showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              alignment: Alignment.center,
              height: 300,
              child: Text('teste'),
            );
          }),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
