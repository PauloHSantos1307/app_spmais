import 'dart:convert';
import 'package:app_spmais/models/itensFormaPagamento.dart';
import 'package:app_spmais/models/userApi.dart';
import 'package:http/http.dart' as http;

class API_Itens_Prestadores {
  static Future getItensOrcados(String usuario_login) async {
    try {
      UserAPI user = UserAPI(usuario_login.trim());
      final String url =
          'http://www.spmaisservico.systems-on.com.br/OrcamentoService.svc/ListarOrcamentosPrestador/';
          //'http://192.168.15.12:9797/OrcamentoService.svc/ListarOrcamentosPrestador/';
      var header = {"Content-Type": "application/json"};
      var _body = json.encode(user);
      return await http.post(url, headers: header, body: _body);
    } catch (e) {
      return false;
    }
  }
}

class API_Insere_Forma_Pagamento {
  static Future setInsereFormaPagamento(int id_orcamento, int id_forma) async {
    try {
      ItensFormaPagamento item = ItensFormaPagamento(id_orcamento, id_forma);
      final String url =
          'http://www.spmaisservico.systems-on.com.br/OrcamentoService.svc/InsereFormaPagamentoAPK/';
      var header = {"Content-Type": "application/json"};
      var _body = json.encode(item);
      return await http.post(url, headers: header, body: _body);
    } catch (e) {
      return false;
    }
  }
}

class API_Remove_Forma_Pagamento {
  static Future deleteItemFormaPagamento(int id_orcamento, int id_forma) async {
    try {
      ItensFormaPagamento item = ItensFormaPagamento(id_orcamento, id_forma);
      final String url =
          'http://www.spmaisservico.systems-on.com.br/OrcamentoService.svc/RemoveFormaPagamentoAPK/';
      var header = {"Content-Type": "application/json"};
      var _body = json.encode(item);
      return await http.post(url, headers: header, body: _body);
    } catch (e) {
      return false;
    }
  }
}