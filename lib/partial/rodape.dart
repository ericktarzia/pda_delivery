import 'package:flutter/material.dart';

class Rodape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Theme.of(context).primaryColor,
      child: Row(
        children:[
          IconButton(icon: Icon(Icons.home), onPressed: null),
          IconButton(icon: Icon(Icons.query_builder), onPressed: null),
          IconButton(icon: Icon(Icons.perm_identity), onPressed: null),
        ],
      ),
    );
  }
}
