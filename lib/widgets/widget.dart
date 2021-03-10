import 'package:app_spmais/helpers/helpersFunctions.dart';
import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    //backgroundColor: const Color(0xFF262AAA),
    backgroundColor: Colors.indigoAccent,
    title: Image.asset(
      "assets/images/logoSPMais.png",
      height: 50,
    ),
  );
}

Widget textUserMain(BuildContext context) {
  _getUserEmail().then((value) {
    return Text(
      value.toString(),
      style: TextStyle(
        color: Color(0xFF1BB5FD),
        fontSize: 18,
      ),
    );
  });
}

Future<String> _getUserEmail() async {
  var userLog = await HelperFunctions.getUserEmailSharedPreference();
  return userLog;
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.white54,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
}

TextStyle simpleTextFieldStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
}

TextStyle mediumTextFieldStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 17,
  );
}
