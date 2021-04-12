class Cliente {
  int id;
  String nome;
  String email;
  String cpf;
  String telefone;
  String imagem;
  String createdAt;
  String updatedAt;
  String senha;

  Cliente(
      {this.id,
      this.nome,
      this.email,
      this.cpf,
      this.telefone,
      this.imagem,
      this.createdAt,
      this.updatedAt,
      this.senha});

  Cliente.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    cpf = json['cpf'];
    telefone = json['telefone'];
    imagem = json['imagem'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['cpf'] = this.cpf;
    data['telefone'] = this.telefone;
    data['imagem'] = this.imagem;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['senha'] = this.senha;
    return data;
  }
}
