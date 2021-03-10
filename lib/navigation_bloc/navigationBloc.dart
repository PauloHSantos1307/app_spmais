import 'package:app_spmais/helpers/helpersFunctions.dart';
import 'package:app_spmais/views/detalhe_atendimento_prestador/detalhe_atendimento_prestador.dart';
import 'package:app_spmais/views/homePage.dart';
import 'package:app_spmais/views/itens_prestadores/itens_prestadores_list.dart';
import 'package:app_spmais/views/myAccountPage.dart';
import 'package:app_spmais/views/myOrdersPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyOrdersCickedEvent,
  ItensPrestadores,
  DetalheAtendimentoPrestador,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccountPage();
        break;
      case NavigationEvents.MyOrdersCickedEvent:
        yield MyOrdersPage();
        break;
      case NavigationEvents.ItensPrestadores:
        yield ItensPrestadores();
        break;
      case NavigationEvents.DetalheAtendimentoPrestador:
        {
          var id = await HelperFunctions.getIdOrcamentoInSharedPreference();
          var logPr = await HelperFunctions.getUserEmailSharedPreference();
          yield DetalheAtendimentoPrestador(id, logPr);
          break;
        }
    }
  }
}
