import 'package:flutter/material.dart';

class Login {
  final String email;
  final String passwordHash;

  const Login({
    @required this.email,
    @required this.passwordHash,
  });
}