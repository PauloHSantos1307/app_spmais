class ItensFormaPagamento {
  int id_orcamento;
  int id_forma;

  ItensFormaPagamento(this.id_orcamento, this.id_forma);

  Map toJson() => {
    'id_orcamento': id_orcamento,
    'id_forma': id_forma,
  };
}