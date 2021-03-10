import 'dart:convert';
import 'dart:core';
import 'dart:math';

import 'package:app_spmais/apis/apiOrcamentosPrestadores.dart';
import 'package:app_spmais/models/itensPrests.dart';
import 'package:flutter/material.dart';

class ItensPrestadoresList with ChangeNotifier {
  final Map<String, ItensPrests> _items = {};

  var _itens_prestadores = new List<ItensPrests>();

  _getItensPrestadores(){
    API_Itens_Prestadores.getItensOrcados(null).then((response) {
      Iterable list = json.decode(response.body);
      _itens_prestadores = list.map((model) => ItensPrests.fromJson(model)).toList();
    });
  }

  List<ItensPrests> get all {
    return [..._itens_prestadores];
  }

  int get count {
    return _itens_prestadores.length;
  }

  ItensPrests byIndex(int i) {
    // return _itens_prestadores.values.elementAt(i);
    return _getItensPrestadores();
  }

  void put(ItensPrests itens) {
    if (itens == null) {
      return;
    }
    if (itens.id_orcamento != null &&
        itens.id_orcamento.toString().trim().isNotEmpty &&
        _items.containsKey(itens.id_orcamento)) {
      _items.update(itens.id_orcamento.toString(), (_) => itens);
    } else {
      final idNew = Random().nextDouble().toString();
      /*_items.putIfAbsent(
        idNew,
            () => ItensPrests(
          id_orcamento: idNew,
          nome_cliente: itens.nome_cliente,
        ),
      );*/
    }
    notifyListeners();
  }

  void remove (ItensPrests itens) {
    if(itens != null && itens.id_orcamento != null){
      _items.remove(itens.id_orcamento);
      notifyListeners();
    }
  }
}