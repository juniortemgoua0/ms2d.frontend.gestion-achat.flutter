import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'client.g.dart';

@JsonSerializable()
class Client {
  Client(
      {required this.codeClient,
      required this.nom,
      required this.email,
      required this.login,
      required this.password,
      required this.sexe});

  String codeClient;
  String nom;
  String email;
  String sexe;
  String login;
  String password;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
