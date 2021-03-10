class User {
  String email;
  String password;
  String liberado;

  User(this.email, this.password, this.liberado);

  Map toJson() => {
    'email': email,
    'password': password,
    'liberado': liberado,
  };

  User.fromJson(Map json)
      : email = json['email'],
        password = json['password'],
        liberado = json['liberado'];
}