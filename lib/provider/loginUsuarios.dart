import 'dart:convert';
// import 'dart:js_util';

import 'package:app_spmais/models/loginRet.dart';
import 'package:app_spmais/models/loginUsuario.dart';
import 'package:flutter/material.dart';

import '../apis/apiLogin.dart';

class LoginUsuario with ChangeNotifier {
  final Map<String, Login> _items = null;

  List<Login> get all {
    // return [..._items.values];
    return null;
  }

  int get count {
    // return _items.length;
    return 0;
  }

  Login byIndex(int i) {
    // return _items.values.elementAt(i);
    return null;
  }

  Future<bool> login(Login login) async {
    if (login == null) {
      return false;
    }
    if (login.email != null && login.email.trim().isNotEmpty) {
      var response = await ApiLogin.validaLogin(login.email, login.passwordHash, null);
      final catMap = jsonDecode(response.body);
      var cat = LoginRet.fromJson(catMap);
      if (cat.liberado == 'S') {
        print("Response :: ${response.body}");
        return true;
      } else {
        print("Response :: ${response.body}");
        return false;
      }
    } else {
      return false;
    }
  }

  void remove(Login login) {
    if (login != null) {
      // _items.remove(login.email);
      notifyListeners();
    }
  }
}