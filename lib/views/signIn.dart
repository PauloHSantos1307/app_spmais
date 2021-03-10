import 'dart:convert';

import 'package:app_spmais/apis/apiLogin.dart';
import 'package:app_spmais/models/loginRet.dart';
import 'package:app_spmais/models/loginUsuario.dart';
import 'package:app_spmais/provider/loginUsuarios.dart';
import 'package:app_spmais/sidebar/sideBarLayout.dart';
import 'package:app_spmais/views/itens_prestadores/itens_prestadores_list.dart';
import 'package:app_spmais/widgets/widget.dart';
import 'package:app_spmais/helpers/helpersFunctions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  final formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController =
  new TextEditingController();
  TextEditingController passwordTextEditingController =
  new TextEditingController();

  bool isLoading = false;

  Future<bool> loginApi(Login login) async {
    if (login == null) {
      return false;
    }
    if (login.email != null && login.email.trim().isNotEmpty) {
      var response = await ApiLogin.validaLogin(login.email, login.passwordHash, null);
      final catMap = jsonDecode(response.body);
      var cat = LoginRet.fromJson(catMap);
      if (cat.liberado == 'S') {
        print("Response :: ${response.body}");
        return true;
      } else {
        print("Response :: ${response.body}");
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    ProgressDialog pr;
    pr = new ProgressDialog(context);
    pr.style(
        message: '      Validando usuário...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w600));

    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
            color: const Color(0xFF262AAA),
            height: MediaQuery.of(context).size.height - 50,
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              color: const Color(0xFF262AAA),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val)
                                ? null
                                : "Informe um e-mail válido";
                          },
                          controller: emailTextEditingController,
                          style: simpleTextFieldStyle(),
                          decoration: textFieldInputDecoration("e-mail"),
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (val) {
                            return val.length > 6
                                ? null
                                : "Senha deve ter mais que 6 caracteres";
                          },
                          controller: passwordTextEditingController,
                          style: simpleTextFieldStyle(),
                          decoration: textFieldInputDecoration("senha"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        "Esqueceu a senha?",
                        style: simpleTextFieldStyle(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () async {
                      pr.show();
                      if (formKey.currentState.validate()) {
                        await loginApi(
                          Login(
                            email: emailTextEditingController.text.trim(),
                            passwordHash: passwordTextEditingController.text.trim(),
                          ),
                        ).then((value){
                          if (value != null && value == true) {
                            HelperFunctions.saveUserLoggedInSharedPreference(true);
                            HelperFunctions.saveUserEmailSharedPreference(emailTextEditingController.text);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SideBarLayout()));
                          } else {
                            pr.hide();
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                titleTextStyle: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                title: Text('Login Inválido'),
                                contentTextStyle: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                content: Text('Login ou Senha Incorretos'),
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
                        });
                      }
                      pr.hide();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0xFF7D79D0),
                          const Color(0xff2A75BC)
                        ]),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        child: Text(
                          "Logar",
                          style: mediumTextFieldStyle(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  /*Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      child: Text(
                        "Sign In with Google",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),*/
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Não tem cadastro?  ",
                        style: mediumTextFieldStyle(),
                      ),
                      GestureDetector(
                        onTap: () {
                          // widget.toggle();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "Registre-se",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
