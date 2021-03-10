class ItensPrests {
  int id_orcamento;
  String nome_cliente;

  ItensPrests(int id_orcamento, String nome_cliente) {
    this.id_orcamento = id_orcamento;
    this.nome_cliente = nome_cliente;
  }

  ItensPrests.fromJson(Map json)
      : id_orcamento = json['id_orcamento'],
        nome_cliente = json['nome_cliente'];
}
