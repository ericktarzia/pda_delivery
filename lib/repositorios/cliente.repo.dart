import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pda_delivery/libs/configs.lib.dart';
import 'package:pda_delivery/models/cliente.model.dart';

class ClienteRepo {
  Future<Cliente> cliente(int id) async {
    var url = "$url_api/cliente/$id";
    print(url);
    final response = await http.get(url);
    Cliente cliente;
    if (response.statusCode == 200) {
      final cli = jsonDecode(response.body);

      cliente = new Cliente.fromJson(cli);
    }
    return cliente;
  }

  Future<String> cadastrar(Cliente cliente) async {
    var url = "$url_api/cadastrar";

    Map data = cliente.toJson();
   // Map data = {'email': 'teste@teste.com', 'senha': '123456'};
    var body = json.encode(data);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    print("${response.statusCode}");
    print("${response.body}");
    return response.body.toString();
  }
}
