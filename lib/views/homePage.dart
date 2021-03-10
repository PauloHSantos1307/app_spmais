import 'package:app_spmais/navigation_bloc/navigationBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget with NavigationStates {
  Material myItemsDashboard(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: new Color(color),
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  // Icon
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /*return Center(
      child: Container(
        child: Text(
          "Inicial",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
      ),
    );*/
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Dashboard",
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Retornar',
            onPressed: () => BlocProvider.of<NavigationBloc>(context)
                .add(NavigationEvents.ItensPrestadores),
          ),
        ],
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        children: [
          myItemsDashboard(Icons.graphic_eq, "Em desenvolvimento", 0xffed622b),
          myItemsDashboard(Icons.graphic_eq, "...", 0xff26cb3c),
          myItemsDashboard(Icons.graphic_eq, "...", 0xffff3266),
          myItemsDashboard(Icons.graphic_eq, "...", 0xff3399fe),
          myItemsDashboard(Icons.graphic_eq, "...", 0xff622A74),
          myItemsDashboard(Icons.graphic_eq, "...", 0xff122F74),
          myItemsDashboard(Icons.graphic_eq, "...", 0xff7297ff),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(2, 240.0),
          StaggeredTile.extent(2, 120.0),
        ],
      ),
    );
  }
}
