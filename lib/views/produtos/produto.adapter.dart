import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pda_delivery/libs/configs.lib.dart';
import 'package:pda_delivery/models/produto.model.dart';

class ProdutoAdapter extends StatelessWidget {
  final Produto produto;

  const ProdutoAdapter({Key key, this.produto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: imagemProduto(produto),
            ),
            Container(
              child: Text(produto.nome, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Text("R\$ ${produto.preco}")
          ],
        ),
      ),
    );
  }

  imagemProduto(Produto ev) {
    var urla = "$url_base/${ev.imagem}";
    
    return CachedNetworkImage(
      width: 100,
      imageUrl: urla,
      placeholder: (context, url) => LinearProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
