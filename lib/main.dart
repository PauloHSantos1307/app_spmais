import 'package:app_spmais/views/splashScreen.dart';
import 'package:flutter/material.dart';

import 'helpers/helpersFunctions.dart';

bool userIsLoggedIn = false;

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void iniState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primac',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'SharedPreferences'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF7D79D0),
        // scaffoldBackgroundColor: Color(0xff1F1F1F),
        // scaffoldBackgroundColor: Color(0x4DFFFFFF),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // ignore: missing_return
      home: SplashScreen(),
      //home: SideBarLayout(),
    );
  }
}

Future<bool> getLoggedInState() async {
  await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
    userIsLoggedIn = value;
    print(userIsLoggedIn);
    return userIsLoggedIn;
  });
}
