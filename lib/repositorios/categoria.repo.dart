import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pda_delivery/libs/configs.lib.dart';
import 'package:pda_delivery/models/categoria.model.dart';

class CategoriaRepo {
  Future<List<Categoria>> lista() async {
    var url = "$url_api/categorias";
    final response = await http.get(url);
    var lista = <Categoria>[];
    if (response.statusCode == 200) {
      final categorias = jsonDecode(response.body);
      for (Map categoria in categorias) {
        lista.add(new Categoria.fromJson(categoria));
      }
    }
    return lista;
  }
}
