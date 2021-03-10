import 'package:app_spmais/models/orcamentoPrestador.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api_Burcar_Atendimentos {
  /*var itensFormaPagamento = new  List<ItensFormaPagamento>();
  var itensOrcados = new  List<ItensFormaPagamento>();*/

  static Future getBuscarAtendimento(String idOrcamento) async {
    try {
      OrcamentoPrestador orcPrest = OrcamentoPrestador(idOrcamento.toString(), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

      //String t = "19156";
      //OrcamentoPrestador orcPrest = OrcamentoPrestador(t.toString(), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

      final String url =
          'http://www.spmaisservico.systems-on.com.br/OrcamentoService.svc/ListarOrcamentoPrestadorId/';
          //'http://192.168.15.15:9797/OrcamentoService.svc/ListarOrcamentoPrestadorId/';
      var header = {"Content-Type": "application/json"};
      var _body = json.encode(orcPrest);

      return await http.post(url, headers: header, body: _body);

      /*await http.post(url, headers: header, body: _body).then((response) {
        var data = json.decode(response.body);
        print(data);
        return data;
      });*/


    } catch (e) {
      return false;
    }
  }
}