part of 'client.dart';

Clients _$ClientFromJson(Map<String, dynamic> json) {
  return Clients(
      codeclient: json['codeclient'] as int,
      nom: json['nom'] as String,
      email: json['email'] as String,
      login: json['login'] as String,
      password: json['password'] as String,
      sexe: json['sexe'] as String);
}

Map<String, dynamic> _$ClientToJson(Clients instance) => <String, dynamic>{
      'codeclient': instance.codeclient,
      'nom': instance.nom,
      'email': instance.email,
      'login': instance.login,
      'password': instance.password,
      'sexe': instance.sexe
    };
