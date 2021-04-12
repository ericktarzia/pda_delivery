import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:pda_delivery/models/categoria.model.dart';
import 'package:pda_delivery/models/produto.model.dart';
import 'package:pda_delivery/partial/fabCarrinho.dart';
import 'package:pda_delivery/partial/menulateral.dart';
import 'package:pda_delivery/partial/rodape.dart';
import 'package:pda_delivery/repositorios/categoria.repo.dart';
import 'package:pda_delivery/repositorios/produto.repo.dart';
import 'package:pda_delivery/views/produtos/produto.adapter.dart';

var _categoriarepo = new CategoriaRepo();
var _produtorepo = new ProdutoRepo();
AnimationController animateController;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs(),
      drawer: MenuLateral(),
    );
  }

  body() {
    var lista = _categoriarepo.lista();
  }

  tabs() {
    return FutureBuilder(
        future: _categoriarepo.lista(),
        builder: (ctx, items) {
          switch (items.connectionState) {
            case ConnectionState.waiting:
              return Center(child: LinearProgressIndicator());

              break;
            default:
              if (items.hasError) {
                return Center(
                  child: Text('Erro: ${items.error}'),
                );
              } else {
                return DefaultTabController(
                  length: items.data.length,
                  child: Scaffold(
                    floatingActionButton: FabCarrinho(),
                    drawer: MenuLateral(),
                    floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
                    bottomNavigationBar: Rodape(),
                    appBar: AppBar(
                      title: Center(
                        child: Text(
                          "CATEGORIAS",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      bottom: TabBar(
                        isScrollable: true,
                        tabs: [
                          for (var i = 0; i < items.data.length; i++)
                            Text(items.data[i].nome)
                        ],
                      ),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBarView(
                        children: <Widget>[
                          for (var i = 0; i < items.data.length; i++)

                            //Text(eventos.data[i].title)

                            produtos(items.data[i] as Categoria)
                        ],
                      ),
                    ),
                  ),
                );
              }
          }
        });
  }

  Widget produtos(Categoria categoria) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        builder: (context, eventos) {
          switch (eventos.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (eventos.hasError)
                return new Text('Error: ${eventos.error}');
              else {
                if (eventos.data.length > 0) {
                  return GridView.builder(
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: eventos.data.length,
                    itemBuilder: (context, index) {
                      Produto evento = eventos.data[index];
                      var ind = index * 100;

                      return ElasticIn(
                        delay: Duration(milliseconds: ind),
                        controller: (controller) =>
                            animateController = controller,
                        child: Column(
                          //children: <Widget>[Text(evento.title)],
                          children: <Widget>[new ProdutoAdapter(produto: evento)],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: ElasticIn(
                      delay: Duration(milliseconds: 100),
                      controller: (controller) => animateController = controller,
                      child: Text("Nada Nessa Categoria"),
                    ),
                  );
                }
              }
          }
        },
        future: _produtorepo.listaPorCategoria(categoria.id),
      ),
    );
  }
}
