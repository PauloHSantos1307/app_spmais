import 'dart:async';
import 'dart:convert';

import 'package:app_spmais/apis/apiOrcamentosPrestadores.dart';
import 'package:app_spmais/helpers/helpersFunctions.dart';
import 'package:app_spmais/models/itensPrests.dart';
import 'package:app_spmais/navigation_bloc/navigationBloc.dart';
import 'package:app_spmais/views/detalhe_atendimento_prestador/detalhe_atendimento_prestador.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItensPrestadores extends StatefulWidget with NavigationStates {
  final String loginPrestador;

  const ItensPrestadores({Key key, this.loginPrestador}) : super(key: key);

  @override
  _ItensPrestadoresState createState() =>
      _ItensPrestadoresState(loginPrestador);
}

class _ItensPrestadoresState extends State<ItensPrestadores> {
  var atendimentos = new List<ItensPrests>();
  Future<ItensPrestadores> post;
  String loginPrest;

  _getAtendimentos(String loginPrestador) async {
    var logPr = await HelperFunctions.getUserEmailSharedPreference();
    API_Itens_Prestadores.getItensOrcados(logPr.toString()).then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        atendimentos =
            lista.map((model) => ItensPrests.fromJson(model)).toList();
      });
    });
  }

  _ItensPrestadoresState(String loginPrestador) {
    _getAtendimentos(loginPrestador);
    loginPrest = loginPrestador;
  }

  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        _getAtendimentos(loginPrest);
        listaAtendimentos();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    // return Container();
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Lista de Atendimentos",
            ),
          ),
        ),
        body: listaAtendimentos(),
      ),
    );
  }

  listaAtendimentos() {
    if (atendimentos.length == 0) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                "Atendimento: 0",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              subtitle: Text(
                "NENHUM ATENDIMENTO NO MOMENTO",
              ),
            );
          },
        ),
      );
    } else {
      return Container(
        margin: new EdgeInsets.all(15.0),
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: atendimentos.length,
          itemBuilder: (context, index) {
            return Container(
              child: ListTile(
                title: Text(
                  "Atendimento: " + atendimentos[index].id_orcamento.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                subtitle: Text(
                  "Cliente: " + atendimentos[index].nome_cliente.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                trailing: Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border:
                          Border.all(width: 4, color: Colors.lightBlueAccent),
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          size: 33,
                          color: Colors.deepPurple.shade500,
                        ),
                        onPressed: () async {
                          await HelperFunctions
                              .saveIdOrcamentoInSharedPreference(
                                  atendimentos[index].id_orcamento.toString());
                          //dispose();
                          BlocProvider.of<NavigationBloc>(context).add(
                              NavigationEvents.DetalheAtendimentoPrestador);
                        }),
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
