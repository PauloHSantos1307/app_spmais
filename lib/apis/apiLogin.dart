import 'dart:convert';
import 'package:app_spmais/models/user.dart';
import 'package:http/http.dart' as http;

class ApiLogin {
  static Future validaLogin(
      String Email, String Password, String Liberado) async {
    try {
      User user = User(Email.trim(), Password, Liberado);
      final String url =
          'http://spmais.systems-on.com.br/Account/LoginAPK/';
          //'http://www.spmaisservico.systems-on.com.br/UsuariosService.svc/RetornarUsuarioAppLogin/';
          //'http://192.168.15.12:9797/UsuariosService.svc/RetornarUsuarioAppLogin/';
          //'http://192.168.15.12:9595/Account/LoginAPK/';
      var header = {"Content-Type": "application/json"};
      var _body = json.encode(user);
      return await http.post(url, headers: header, body: _body);
    } catch (e) {
      return false;
    }
  }
}
