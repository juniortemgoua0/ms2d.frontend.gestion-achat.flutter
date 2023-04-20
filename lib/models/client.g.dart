part of 'client.dart';

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(
      codeClient: json['codeClient'] as String,
      nom: json['nom'] as String,
      email: json['email'] as String,
      login: json['login'] as String,
      password: json['password'] as String,
      sexe: json['sexe'] as String);
}

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'codeClient': instance.codeClient,
      'nom': instance.nom,
      'email': instance.email,
      'login': instance.login,
      'password': instance.password,
      'sexe': instance.sexe
    };
