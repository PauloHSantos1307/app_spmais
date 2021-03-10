import 'dart:convert';
import 'package:app_spmais/apis/apiOrcamentosPrestadores.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:http/http.dart' as http;

import 'package:app_spmais/apis/apiBaixaAtendimento.dart';
import 'package:app_spmais/apis/apiBuscarAtendimento.dart';
import 'package:app_spmais/models/orcamentoPrestador.dart';
import 'package:app_spmais/navigation_bloc/navigationBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DetalheAtendimentoPrestador extends StatefulWidget with NavigationStates {
  final String id_orcamento, login;

  DetalheAtendimentoPrestador(this.id_orcamento, this.login);

  @override
  _DetalheAtendimentoPrestadorState createState() =>
      _DetalheAtendimentoPrestadorState();
}

class _DetalheAtendimentoPrestadorState
    extends State<DetalheAtendimentoPrestador> {
  final formKey = GlobalKey<FormState>();
  TextEditingController totalCobradoTextEditingController =
      new TextEditingController();
  Future<OrcamentoPrestador> post;

  Future<OrcamentoPrestador> fetchPost() async {
    final response =
        await Api_Burcar_Atendimentos.getBuscarAtendimento(widget.id_orcamento);

    if (response.statusCode == 200) {
      // se o servidor retornar um response OK, vamos fazer o parse no JSON
      print(response.body);
      return OrcamentoPrestador.fromJson(json.decode(response.body));
    } else {
      // se a responsta não for OK , lançamos um erro
      throw Exception('Falha ao carregar dados');
    }
  }

  // ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _getListaFormasPagamento();
  }

  void _onClick(BuildContext context) => confirmaFinalizar(context);

  @override
  Widget build(BuildContext context) {
    TextStyle _ts = TextStyle(fontSize: 26.0);
    TextStyle _hts = TextStyle(fontSize: 16.0);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Dados do Atendimento",
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Show Snackbar',
            onPressed: () => BlocProvider.of<NavigationBloc>(context)
                .add(NavigationEvents.ItensPrestadores),
          ),
        ],
      ),
      persistentFooterButtons: <Widget>[
        Text(
          "Finalizar e dar baixa no atendimento",
          style: TextStyle(fontSize: 18, color: Colors.blueAccent),
        ),
        new IconButton(
          icon: new Icon(
            Icons.check,
            color: Colors.green,
            size: 34,
          ),
          onPressed: () => _onClick(context),
        ),
      ],
      body: Center(
        child: Container(
          margin: new EdgeInsets.all(15.0),
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: FutureBuilder<OrcamentoPrestador>(
            future: post = fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  // controller: _scrollController,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return new Column(
                      children: <Widget>[
                        new TextField(
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 22),
                          decoration: InputDecoration.collapsed(
                            hintText: null,
                            border: const OutlineInputBorder(),
                            enabled: false,
                          ),
                          controller: TextEditingController(
                            text: "Orçamento nº:  " +
                                snapshot.data.id_orcamento.toString(),
                          ),
                        ),
                        new SizedBox(height: 10.0),
                        new TextField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Cliente',
                            enabled: false,
                          ),
                          controller: TextEditingController(
                            text: snapshot.data.nome_cliente.toString(),
                          ),
                        ),
                        new SizedBox(height: 10.0),
                        new TextField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Data de atendimento',
                            enabled: false,
                          ),
                          controller: TextEditingController(
                            text: snapshot.data.Data_Atendimento_Tratada
                                    .toString() +
                                ' as ' +
                                (snapshot.data.Data_Hora_Programada
                                            .toString()
                                            .isEmpty ||
                                        snapshot.data.Data_Hora_Programada ==
                                            null
                                    ? '00:00'
                                    : snapshot.data.Data_Hora_Programada
                                        .toString()),
                          ),
                        ),
                        new SizedBox(height: 10.0),
                        new TextField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Total do Orçamento',
                            enabled: false,
                          ),
                          controller: TextEditingController(
                            text: NumberFormat.simpleCurrency(locale: 'pt_BR')
                                .format(snapshot.data.Total_Orcado),
                          ),
                        ),
                        new SizedBox(height: 10.0),
                        new TextField(
                          maxLines: 6,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Local atendimento',
                            enabled: false,
                          ),
                          controller: TextEditingController(
                            text: snapshot.data.endereco_atendimento
                                    .toString() +
                                '\n' +
                                'Bairro:    ' +
                                snapshot.data.bairro_atendimento.toString() +
                                '\n' +
                                'Cidade / UF:    ' +
                                snapshot.data.cidade_atendimento.toString() +
                                ' - ' +
                                snapshot.data.uf_atendimento.toString() +
                                '\n' +
                                'CEP:    ' +
                                snapshot.data.cep_atendimento.toString(),
                          ),
                        ),
                        new SizedBox(height: 10.0),
                        /*new TextField(
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Telefone de Contato',
                            enabled: false,
                          ),
                          controller: TextEditingController(
                            text: snapshot.data.telefone_contato.toString(),
                          ),
                        ),
                        new SizedBox(height: 10.0),*/
                        new TextField(
                          maxLines: 10,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            labelText: 'Diagnóstico / Observação',
                            enabled: false,
                          ),
                          controller: TextEditingController(
                            text: snapshot.data.observacao.toString(),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        new SizedBox(
                          height: 40.0,
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'Informe abaixo o Total e o Tipo do pagamento')
                            ],
                          ),
                        ),
                        new SizedBox(height: 10.0),
                        new Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: TextField(
                                inputFormatters: [
                                  CurrencyTextInputFormatter(
                                    decimalDigits: 2,
                                    locale: 'pt-Br',
                                  )
                                ],
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Total Cobrado',
                                ),
                                controller: totalCobradoTextEditingController,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 2, color: Colors.lightBlueAccent),
                                ),
                                /*child: Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.blueAccent,
                                ),*/
                                child: IconButton(
                                  icon: Icon(
                                    Icons.check,
                                    size: 33,
                                    color: Colors.greenAccent,
                                  ),
                                  tooltip: 'Atualizar o Total Pago',
                                  onPressed: () {
                                    atualizarTotalPago(context);
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),

                        /*new TextField(
                          inputFormatters: [
                            CurrencyTextInputFormatter(
                              decimalDigits: 2,
                              locale: 'pt-Br',
                            )
                          ],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Total Cobrado',
                          ),
                          // controller: totalCobradoTextEditingController,
                          controller: TextEditingController(
                            text: snapshot.data.Total_Pago
                                .toString()
                                .replaceAll('.', ','),
                          ),
                        ),*/

                        /*new TextField(
                          inputFormatters: [
                            CurrencyTextInputFormatter(
                              decimalDigits: 2,
                              locale: 'pt-Br',
                            )
                          ],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Total Cobrado',
                          ),
                          // controller: totalCobradoTextEditingController,
                          controller: TextEditingController(
                            text: snapshot.data.Total_Pago.toString().replaceAll('.', ','),
                          ),
                        ),*/

                        SizedBox(
                          height: 20.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 15.0),
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.lightBlueAccent,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton<String>(
                                      value: _myState,
                                      iconSize: 30,
                                      icon: (null),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      hint: Text('Forma(s) de pagamento'),
                                      items: statesList?.map((item) {
                                            return new DropdownMenuItem(
                                              child: new Text(item[
                                                  'Nome_Formas_Pagamento']),
                                              value: item['Id_Formas_Pagamento']
                                                  .toString(),
                                            );
                                          })?.toList() ??
                                          [],
                                      onChanged: (String newValue) {
                                        setState(() {
                                          _myState = newValue;
                                          _setInsFrmPgto();
                                          //_getStateList();
                                          print('My State: ' + _myState);
                                        });
                                        /*_scrollController.animateTo(
                                          _scrollController.position.maxScrollExtent,
                                          curve: Curves.easeOut,
                                          duration: const Duration(milliseconds: 300),
                                        );*/
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        new SizedBox(height: 10.0),
                        new DataTable(
                            columns: [
                              DataColumn(
                                label: Text('Forma'),
                              ),
                              DataColumn(
                                label: Text('Ação'),
                              ),
                            ],
                            rows: snapshot.data.itensFormasPagamento == null
                                ? <DataRow>[
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text('Forma não informada')),
                                        DataCell(
                                          IconButton(
                                            icon: const Icon(
                                              Icons.help_outline,
                                              color: Colors.green,
                                            ),
                                            tooltip:
                                                'Nenhuma forma de pagamento informada!',
                                            onPressed: () => null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]
                                : <DataRow>[
                                    for (var rowData
                                        in snapshot.data.itensFormasPagamento)
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(Text(rowData['Nome_Forma'])),
                                          DataCell(
                                            IconButton(
                                              icon: const Icon(
                                                Icons.clear,
                                                color: Colors.red,
                                              ),
                                              tooltip: 'Excluir Forma',
                                              onPressed: () async {
                                                await _onSearchButtonPressed(
                                                    rowData['id_forma']);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                  ]),
                        new SizedBox(height: 10.0),

                        /*
                        // Esse item pode ser utilizado posteriormente
                        MoneyTextFormField(
                          settings: MoneyTextFormFieldSettings(
                              controller: totalCobradoTextEditingController,
                              moneyFormatSettings: MoneyFormatSettings(
                                thousandSeparator: '.',
                                decimalSeparator: ',',
                                currencySymbol: 'R\$',
                                displayFormat:
                                    MoneyDisplayFormat.symbolOnLeft,
                              ),
                              appearanceSettings: AppearanceSettings(
                                  padding: EdgeInsets.all(15.0),
                                  labelText: 'Total Cobrado',
                                  hintText: 'Informe o Valor Cobrado',
                                  labelStyle: _hts,
                                  inputStyle:
                                      _hts.copyWith(color: Colors.orange),
                                  formattedStyle:
                                      _hts.copyWith(color: Colors.blue))),
                        ),*/
                      ],
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  baixaOrcamento(BuildContext context) async {
    var retorno = await APIS_ATENDIMENTO.postBaixarAtendimento(
        widget.login,
        widget.id_orcamento,
        totalCobradoTextEditingController.text);

    if (retorno) {
      BlocProvider.of<NavigationBloc>(context)
          .add(NavigationEvents.ItensPrestadores);
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          titleTextStyle: TextStyle(
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          title: Text('Erro no processo!'),
          contentTextStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          content: Text('Não foi possível dar baixar no atendimento'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              textColor: Colors.black,
              onPressed: () =>
                  Navigator.of(context, rootNavigator: true).pop(false),
            ),
          ],
        ),
      );
    }
  }

  atualizarTotalPago(BuildContext context) async {
    var retorno = await APIS_ATENDIMENTO.postAtualizarTotalPagoAtendimento(
        widget.login,
        widget.id_orcamento,
        totalCobradoTextEditingController.text);

    if (retorno) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          titleTextStyle: TextStyle(
            color: Colors.lightGreen,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          title: Text('Sucesso!'),
          contentTextStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          content: Text('O Total Pago foi atualizado!'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              textColor: Colors.black,
              onPressed: () =>
                  Navigator.of(context, rootNavigator: true).pop(false),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          titleTextStyle: TextStyle(
            color: Colors.redAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          title: Text('Erro no processo!'),
          contentTextStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          content: Text('Não foi atualizar o Total Pago deste atendimento!\n\nPor favor, tente novamente em alguns instantes!'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              textColor: Colors.black,
              onPressed: () =>
                  Navigator.of(context, rootNavigator: true).pop(false),
            ),
          ],
        ),
      );
    }
  }

  confirmaFinalizar(BuildContext context) {
    Widget cancelarBtn = FlatButton(
      onPressed: () => {
        Navigator.of(context, rootNavigator: true).pop(false),
        // Navigator.pop(context, false),
      },
      child: Text("Cancelar"),
    );
    Widget confirmarBtn = FlatButton(
      onPressed: () => {
        Navigator.of(context, rootNavigator: true).pop(false),
        baixaOrcamento(context),
      },
      child: Text("Confirmar"),
    );
    AlertDialog alerta = AlertDialog(
      title: Text("Atenção!"),
      content: Text(
          "Quer mesmo Finalizar e Baixar esse Atendimento?\n\nEsse procedimento não pode ser desfeito por você!"),
      actions: [
        cancelarBtn,
        confirmarBtn,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  List statesList = List();
  String _myState;

  String stateInfoUrl = 'http://cleanions.bestweb.my/api/location/get_state';

  Future<String> _getListaFormasPagamento() async {
    try {
      final String url =
          'http://www.spmaisservico.systems-on.com.br/FormasPagamentoService.svc/ListarFormas/';
      var header = {"Content-Type": "application/json"};
      await http.post(url, headers: header).then((response) {
        var data = json.decode(response.body);
        print(data);
        setState(() {
          statesList = data;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  _setInsFrmPgto() async {
    await API_Insere_Forma_Pagamento.setInsereFormaPagamento(
            int.parse(widget.id_orcamento), int.parse(_myState))
        .then((response) {
      setState(() {
        //Iterable item = json.decode(response.body);
        //print(item);
        // initState();
      });
    });
  }

  _rmvItemFrmPgto(int _myFrmPgto) async {
    await API_Remove_Forma_Pagamento.deleteItemFormaPagamento(
            int.parse(widget.id_orcamento), _myFrmPgto)
        .then((response) {
      setState(() {
        //Iterable item = json.decode(response.body);
        //print(item);
        // initState();
      });
    });
  }

  _onSearchButtonPressed(int valor) {
    print("search button clicked: " + valor.toString());
    _rmvItemFrmPgto(valor);
  }
}
