import 'package:app_spmais/helpers/helpersFunctions.dart';
import 'package:app_spmais/views/signIn.dart';
import 'package:app_spmais/widgets/widget.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logoPrimac.png",
          height: 50,
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              // authMethods.signOut();
              await HelperFunctions.removeUserEmailSharedPreference().whenComplete(()
              {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              });

            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          ),
        ],
      ),
      body: chatRoomList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          /*Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));*/
        },
      ),
    );
  }

  Widget chatRoomList() {
    return Container(
      child: Text('Menu principal'),
    );
  }
}
