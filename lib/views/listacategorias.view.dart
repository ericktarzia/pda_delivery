import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pda_delivery/libs/configs.lib.dart';
import 'package:pda_delivery/models/categoria.model.dart';
import 'package:pda_delivery/partial/menulateral.dart';
import 'package:pda_delivery/partial/rodape.dart';
import 'package:pda_delivery/repositorios/categoria.repo.dart';

var _catRepo = new CategoriaRepo();
AnimationController animateController;

class ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('CATEGORIAS'),
        ),
      ),
      bottomNavigationBar: Rodape(),
      drawer: MenuLateral(),
      body: body(),
    );
  }

  body() {
    return FutureBuilder(
        future: _catRepo.lista(),
        builder: (ctx, items) {
          switch (items.connectionState) {
            case ConnectionState.waiting:
              return Center(child: LinearProgressIndicator());
              break;
            default:
              if (items.data.length > 0) {
                return GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: items.data.length,
                  itemBuilder: (context, index) {
                    Categoria evento = items.data[index];
                    var ind = index * 100;

                    return ElasticIn(
                      delay: Duration(milliseconds: ind),
                      controller: (controller) =>
                          animateController = controller,
                      child: Column(
                        //children: <Widget>[Text(evento.title)],
                        children: <Widget>[item(evento)],
                      ),
                    );
                  },
                );
              } else {
                return Center(child: Text('Nada para exibir!'));
              }
          }
        });
  }

  item(Categoria categoria) {
    var urla = "$url_base/${categoria.imagem}";
    return Card(
      child: Column(
        children: [
          Container(
            child: CachedNetworkImage(
              width: 100,
              imageUrl: urla,
              placeholder: (context, url) => LinearProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Center(child: Text(categoria.nome))
        ],
      ),
    );
  }
}
