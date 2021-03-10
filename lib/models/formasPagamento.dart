class FormasPagamento {
  int Id_Formas_Pagamento;
  String Nome_Formas_Pagamento;
  String taxa_percentual;

  FormasPagamento(int Id_Formas_Pagamento, String Nome_Formas_Pagamento,
      String taxa_percentual) {
    this.Id_Formas_Pagamento = Id_Formas_Pagamento;
    this.Nome_Formas_Pagamento = Nome_Formas_Pagamento;
    this.taxa_percentual = taxa_percentual;
  }

  FormasPagamento.fromJson(Map json)
      : Id_Formas_Pagamento = json['Id_Formas_Pagamento'],
        Nome_Formas_Pagamento = json['Nome_Formas_Pagamento'],
        taxa_percentual = json['taxa_percentual'];
}
