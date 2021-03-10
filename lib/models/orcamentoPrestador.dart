import 'dart:ffi';

class OrcamentoPrestador {
  String id_orcamento;
  String nome_cliente;
  String endereco_atendimento;
  String bairro_atendimento;
  String cidade_atendimento;
  String uf_atendimento;
  String cep_atendimento;
  String telefone_contato;
  String Data_Atendimento;
  String Data_Atendimento_Tratada;
  String Data_Hora_Programada;
  double Total_Orcado;
  double Total_Pago;
  String observacao;
  int id_status;
  int id_cliente;
  int id_prestador;
  List itensFormasPagamento = new List();

  OrcamentoPrestador(
    this.id_orcamento,
    this.nome_cliente,
    this.endereco_atendimento,
    this.bairro_atendimento,
    this.cidade_atendimento,
    this.uf_atendimento,
    this.cep_atendimento,
    this.telefone_contato,
    this.Data_Atendimento,
    this.Data_Atendimento_Tratada,
    this.Data_Hora_Programada,
    this.Total_Orcado,
    this.Total_Pago,
    this.observacao,
    this.id_status,
    this.id_cliente,
    this.id_prestador,
    this.itensFormasPagamento,
  );

  Map toJson() => {
        'id': id_orcamento,
        'nome_cliente': nome_cliente,
        'endereco_atendimento': endereco_atendimento,
        'bairro_atendimento': bairro_atendimento,
        'cidade_atendimento': cidade_atendimento,
        'uf_atendimento': uf_atendimento,
        'cep_atendimento': cep_atendimento,
        'telefone_contato': telefone_contato,
        'Data_Atendimento': Data_Atendimento,
        'Data_Atendimento_Tratada': Data_Atendimento_Tratada,
        'Data_Hora_Programada': Data_Hora_Programada,
        'Total_Orcado': Total_Orcado,
        'Total_Pago': Total_Pago,
        'id_status': id_status,
        'id_cliente': id_cliente,
        'id_prestador': id_prestador,
        'observacao': observacao,
        'Itens_Forma_Pagamento': itensFormasPagamento,
      };

  OrcamentoPrestador.fromJson(Map json)
      : id_orcamento = json['id_orcamento'].toString(),
        nome_cliente = json['nome_cliente'],
        endereco_atendimento = json['endereco_atendimento'],
        bairro_atendimento = json['bairro_atendimento'],
        cidade_atendimento = json['cidade_atendimento'],
        uf_atendimento = json['uf_atendimento'],
        cep_atendimento = json['cep_atendimento'],
        telefone_contato = json['telefone_contato'],
        Data_Atendimento = json['Data_Atendimento'],
        Data_Atendimento_Tratada = json['Data_Atendimento_Tratada'],
        Data_Hora_Programada = json['Data_Hora_Programada'],
        Total_Orcado = json['Total_Orcado'],
        Total_Pago = json['Total_Pago'],
        id_status = json['id_status'],
        id_cliente = json['id_cliente'],
        observacao = json['observacao'],
        id_prestador = json['id_prestador'],
        itensFormasPagamento = json['Itens_Forma_Pagamento'];
}
/*

class OrcamentoPrestador {
  String dataAtendimento;
  String dataHoraProgramada;
  Null formaPagamento;
  int idStatus;
  List<ItensFormaPagamento> itensFormaPagamento;
  List<ItensOrcados> itensOrcados;
  Null itensRealizados;
  Null status;
  int totalOrcado;
  int totalPago;
  int totalRealizado;
  String bairroAtendimento;
  String cepAtendimento;
  String cidadeAtendimento;
  Null corStatus;
  String enderecoAtendimento;
  int idCliente;
  int idOrcamento;
  int idPrestador;
  String nomeCliente;
  String telefoneContato;
  String ufAtendimento;

  OrcamentoPrestador(
      {this.dataAtendimento,
        this.dataHoraProgramada,
        this.formaPagamento,
        this.idStatus,
        this.itensFormaPagamento,
        this.itensOrcados,
        this.itensRealizados,
        this.status,
        this.totalOrcado,
        this.totalPago,
        this.totalRealizado,
        this.bairroAtendimento,
        this.cepAtendimento,
        this.cidadeAtendimento,
        this.corStatus,
        this.enderecoAtendimento,
        this.idCliente,
        this.idOrcamento,
        this.idPrestador,
        this.nomeCliente,
        this.telefoneContato,
        this.ufAtendimento});

  OrcamentoPrestador.fromJson(Map<String, dynamic> json) {
    dataAtendimento = json['Data_Atendimento'];
    dataHoraProgramada = json['Data_Hora_Programada'];
    formaPagamento = json['Forma_Pagamento'];
    idStatus = json['Id_Status'];
    if (json['Itens_Forma_Pagamento'] != null) {
      itensFormaPagamento = new List<ItensFormaPagamento>();
      json['Itens_Forma_Pagamento'].forEach((v) {
        itensFormaPagamento.add(new ItensFormaPagamento.fromJson(v));
      });
    }
    if (json['Itens_Orcados'] != null) {
      itensOrcados = new List<ItensOrcados>();
      json['Itens_Orcados'].forEach((v) {
        itensOrcados.add(new ItensOrcados.fromJson(v));
      });
    }
    itensRealizados = json['Itens_Realizados'];
    status = json['Status'];
    totalOrcado = json['Total_Orcado'];
    totalPago = json['Total_Pago'];
    totalRealizado = json['Total_Realizado'];
    bairroAtendimento = json['bairro_atendimento'];
    cepAtendimento = json['cep_atendimento'];
    cidadeAtendimento = json['cidade_atendimento'];
    corStatus = json['cor_status'];
    enderecoAtendimento = json['endereco_atendimento'];
    idCliente = json['id_cliente'];
    idOrcamento = json['id_orcamento'];
    idPrestador = json['id_prestador'];
    nomeCliente = json['nome_cliente'];
    telefoneContato = json['telefone_contato'];
    ufAtendimento = json['uf_atendimento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Data_Atendimento'] = this.dataAtendimento;
    data['Data_Hora_Programada'] = this.dataHoraProgramada;
    data['Forma_Pagamento'] = this.formaPagamento;
    data['Id_Status'] = this.idStatus;
    if (this.itensFormaPagamento != null) {
      data['Itens_Forma_Pagamento'] =
          this.itensFormaPagamento.map((v) => v.toJson()).toList();
    }
    if (this.itensOrcados != null) {
      data['Itens_Orcados'] = this.itensOrcados.map((v) => v.toJson()).toList();
    }
    data['Itens_Realizados'] = this.itensRealizados;
    data['Status'] = this.status;
    data['Total_Orcado'] = this.totalOrcado;
    data['Total_Pago'] = this.totalPago;
    data['Total_Realizado'] = this.totalRealizado;
    data['bairro_atendimento'] = this.bairroAtendimento;
    data['cep_atendimento'] = this.cepAtendimento;
    data['cidade_atendimento'] = this.cidadeAtendimento;
    data['cor_status'] = this.corStatus;
    data['endereco_atendimento'] = this.enderecoAtendimento;
    data['id_cliente'] = this.idCliente;
    data['id_orcamento'] = this.idOrcamento;
    data['id_prestador'] = this.idPrestador;
    data['nome_cliente'] = this.nomeCliente;
    data['telefone_contato'] = this.telefoneContato;
    data['uf_atendimento'] = this.ufAtendimento;
    return data;
  }
}

class ItensFormaPagamento {
  String nomeForma;
  int idForma;
  int idOrcamento;

  ItensFormaPagamento({this.nomeForma, this.idForma, this.idOrcamento});

  ItensFormaPagamento.fromJson(Map<String, dynamic> json) {
    nomeForma = json['Nome_Forma'];
    idForma = json['id_forma'];
    idOrcamento = json['id_orcamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nome_Forma'] = this.nomeForma;
    data['id_forma'] = this.idForma;
    data['id_orcamento'] = this.idOrcamento;
    return data;
  }
}

class ItensOrcados {
  String nomeServico;
  int idOrcamento;
  int idServico;

  ItensOrcados({this.nomeServico, this.idOrcamento, this.idServico});

  ItensOrcados.fromJson(Map<String, dynamic> json) {
    nomeServico = json['Nome_Servico'];
    idOrcamento = json['id_orcamento'];
    idServico = json['id_servico'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nome_Servico'] = this.nomeServico;
    data['id_orcamento'] = this.idOrcamento;
    data['id_servico'] = this.idServico;
    return data;
  }
}

 */
