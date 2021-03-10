class LoginRet {
  String codigoRetorno;
  String email;
  String id;
  String liberado;
  int lockoutEnabled;
  String mensagemRetorno;
  String password;
  String passwordConfirmed;
  String userName;

  LoginRet(
      {this.codigoRetorno,
        this.email,
        this.id,
        this.liberado,
        this.lockoutEnabled,
        this.mensagemRetorno,
        this.password,
        this.passwordConfirmed,
        this.userName});

  LoginRet.fromJson(Map<String, dynamic> json) {
    codigoRetorno = json['CodigoRetorno'];
    email = json['Email'];
    id = json['Id'];
    liberado = json['Liberado'];
    lockoutEnabled = json['LockoutEnabled'];
    mensagemRetorno = json['MensagemRetorno'];
    password = json['Password'];
    passwordConfirmed = json['PasswordConfirmed'];
    userName = json['UserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CodigoRetorno'] = this.codigoRetorno;
    data['Email'] = this.email;
    data['Id'] = this.id;
    data['Liberado'] = this.liberado;
    data['LockoutEnabled'] = this.lockoutEnabled;
    data['MensagemRetorno'] = this.mensagemRetorno;
    data['Password'] = this.password;
    data['PasswordConfirmed'] = this.passwordConfirmed;
    data['UserName'] = this.userName;
    return data;
  }
}