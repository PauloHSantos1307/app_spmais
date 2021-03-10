class UserAPI {
  String prestador;

  UserAPI(this.prestador);

  Map toJson() => {
    'prestador': prestador,
  };
}