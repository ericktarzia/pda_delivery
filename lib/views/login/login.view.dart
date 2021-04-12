import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

import 'package:pda_delivery/libs/configs.lib.dart';
import 'package:pda_delivery/models/cliente.model.dart';
import 'package:pda_delivery/repositorios/cliente.repo.dart';
import 'package:pda_delivery/views/home.view.dart';

var _repo = ClienteRepo();


class TelaLogin extends StatelessWidget {
  Future<String> _authUser(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');

    Cliente cliente = new Cliente();
    cliente.email = data.name;
    cliente.senha = data.password;

    var id = await _repo.cadastrar(cliente);
    if (id != null ) {
      
      return null;
    } else {
      return 'Algo deu Errado!';
    }

    /*

    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
    */
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
   
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: nome_app,
      // logo: 'assets/images/ecorp-lightblue.png',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Get.off(Home());
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
