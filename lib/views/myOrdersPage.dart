import 'package:app_spmais/apis/apiOrcamentosPrestadores.dart';
import 'package:app_spmais/navigation_bloc/navigationBloc.dart';
import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget with NavigationStates{
  final String loginPrestador;
  const MyOrdersPage({Key key, this.loginPrestador}) : super(key: key);

  /*_getAtendimentos(String loginPrestador) {
    API_Itens_Prestadores.getItensOrcados(loginPrestador.toString())
        .then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        atendimentos =
            lista.map((model) => ItensPrests.fromJson(model)).toList();
      });
    });
  }*/



   @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Roteiro",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}
