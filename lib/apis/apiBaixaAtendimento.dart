import 'dart:convert';
import 'package:http/http.dart' as http;

class APIS_ATENDIMENTO {

  static Future<bool> postBaixarAtendimento(
      String Prestador, String Id_Orcamento, String valorTotal) async {
    try {
      BxAtdo bxatdo = BxAtdo(Prestador.trim(), Id_Orcamento, valorTotal);
      final String url =
          'http://www.spmaisservico.systems-on.com.br/OrcamentoService.svc/BaixarOrcamentosPrestador/';
      var header = {"Content-Type": "application/json"};
      var _body = json.encode(bxatdo);
      var response = await http.post(url, headers: header, body: _body);
      if (response.statusCode == 200)
        return true;
      else
        return false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> postAtualizarTotalPagoAtendimento(
      String Prestador, String Id_Orcamento, String valorTotal) async {
    try {
      BxAtdo bxatdo = BxAtdo(Prestador.trim(), Id_Orcamento, valorTotal);
      final String url =
          'http://www.spmaisservico.systems-on.com.br/OrcamentoService.svc/AtualizarTotalPagoOrcamentosPrestador/';
      var header = {"Content-Type": "application/json"};
      var _body = json.encode(bxatdo);
      var response = await http.post(url, headers: header, body: _body);
      if (response.statusCode == 200)
        return true;
      else
        return false;
    } catch (e) {
      return false;
    }
  }

}

class BxAtdo {
  String Prestador;
  String Id_Orcamento;
  String TotalPagamento;

  BxAtdo(String Prestador, String Id_Orcamento, String TotalPagamento) {
    this.Prestador = Prestador;
    this.Id_Orcamento = Id_Orcamento;
    this.TotalPagamento = TotalPagamento;
  }

  Map toJson() => {
        'prestador': Prestador,
        'id_orcamento': Id_Orcamento,
        'totalPagamento': TotalPagamento,
      };

  BxAtdo.fromJson(Map json)
      : Prestador = json['prestador'],
        Id_Orcamento = json['id_orcamento'],
        TotalPagamento = json['totalPagamento'];
}
