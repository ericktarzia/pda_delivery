import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pda_delivery/libs/configs.lib.dart';
import 'package:pda_delivery/models/produto.model.dart';

class ProdutoRepo {
  Future<List<Produto>> listaPorCategoria(int categoria) async {
    var url = "$url_api/produtosCategoria/$categoria";
    print(url);
    final response = await http.get(url);
    var lista = <Produto>[];
    if (response.statusCode == 200) {
      final produtos = jsonDecode(response.body);
      for (Map produto in produtos) {
        lista.add(new Produto.fromJson(produto));
      }
    }
    return lista;
  }
}
