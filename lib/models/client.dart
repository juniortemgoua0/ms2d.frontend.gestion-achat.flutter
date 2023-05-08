import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'client.g.dart';

@JsonSerializable()
class Clients {
  Clients(
      {dynamic codeclient = 0,
      required this.nom,
      required this.email,
      required this.login,
      required this.password,
      required this.sexe});

  dynamic codeclient;
  String nom;
  String email;
  String sexe;
  String login;
  String password;

  factory Clients.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
