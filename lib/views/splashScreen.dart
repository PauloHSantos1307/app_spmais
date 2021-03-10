import 'dart:async';

import 'package:app_spmais/helpers/helpersFunctions.dart';
import 'package:app_spmais/sidebar/sideBarLayout.dart';
import 'package:app_spmais/views/signIn.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool finalEmail;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(
          Duration(seconds: 5),
          () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        finalEmail == null ? SignIn() : SideBarLayout()),
                /*MaterialPageRoute(
                    builder: (context) =>
                        finalEmail == null ? SignIn() : SideMenu()),*/
              ));
    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = await HelperFunctions.getUserLoggedInSharedPreference();
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.all(20),
        padding: EdgeInsets.only(
          top: 80,
          left: 40,
          right: 40,
        ),
        // color: Colors.black,
        color: Color(0x4DFFFFFF),
        child: Form(
          child: ListView(
            children: <Widget>[
              SizedBox(
                child: Image.asset("assets/images/logoSPMais.png"),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
