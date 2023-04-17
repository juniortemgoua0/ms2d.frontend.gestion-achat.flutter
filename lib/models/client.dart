import 'dart:core';
import 'dart:ffi';

class Client {
  String? codeClient;
  String? nom;
  String? email;
  String? sexe;
  String? login;
  String? password;

  Client(
      {this.codeClient,
      this.nom,
      this.email,
      this.login,
      this.password,
      this.sexe});
}
