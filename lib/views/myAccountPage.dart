import 'package:app_spmais/navigation_bloc/navigationBloc.dart';
import 'package:flutter/material.dart';

class MyAccountPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Minha Conta",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );
  }
}
