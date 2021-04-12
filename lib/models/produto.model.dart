class Produto {
  int id;
  String nome;
  int categoria;
  String imagem;
  var preco;
  int status;
  String createdAt;
  String updatedAt;

  Produto(
      {this.id,
      this.nome,
      this.categoria,
      this.imagem,
      this.preco,
      this.status,
      this.createdAt,
      this.updatedAt});

  Produto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    categoria = json['categoria'];
    imagem = json['imagem'];
    preco = json['preco'].toStringAsFixed(2);
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['categoria'] = this.categoria;
    data['imagem'] = this.imagem;
    data['preco'] = this.preco;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}