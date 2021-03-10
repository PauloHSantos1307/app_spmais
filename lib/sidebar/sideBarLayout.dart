import 'package:app_spmais/navigation_bloc/navigationBloc.dart';
import 'package:app_spmais/sidebar/sideBar.dart';
import 'package:app_spmais/views/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(HomePage()),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationStates){
                return navigationStates as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
