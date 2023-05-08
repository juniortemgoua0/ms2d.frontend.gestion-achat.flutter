import 'dart:async';
import 'dart:convert';
import 'package:gestion_achat_front/helper/ApiResponse.dart';
import 'package:gestion_achat_front/models/client.dart';
import 'package:http/http.dart' as http;

import '../customModels/ErrorObject.dart';

class ClientService {
  static const API = 'http://127.0.0.1:8009';

  static const headers = {
    'Content-Type': 'application/json',
    "Accept": 'application/json'
  };

  Future<ApiResponse<dynamic>> createClient(Clients client) async {
    var url = Uri.parse("$API/clients");

    return http
        .post(url, headers: headers, body: jsonEncode(client))
        .then((data) {
      final int statueCode = data.statusCode;

      if (statueCode == 200) {
        Map<String, dynamic> jsonData = json.decode(data.body);

        Clients client =  Clients(
          nom: jsonData["nom"],
          email: jsonData["email"],
          login: jsonData["login"],
          password: jsonData["password"],
          sexe: jsonData["sexe"],
        );

        print(client);

        return ApiResponse<Clients>(
            errorMessage: '', data: client, error: false);
      } else {
        return ApiResponse<ErrorObject>(
            error: true,
            errorMessage: "Une erreur s'est produite",
            data: ErrorObject(errorCode: statueCode, errorText: "Error"));
      }
    }).catchError((_) =>
        ApiResponse<ErrorObject>(
            error: true,
            errorMessage: 'unable to connect to contact the server',
            data: ErrorObject(errorCode: 404, errorText: "Empty")));
  }


  Future<ApiResponse<List<Clients>>> getAllClients() async {
    try {
      final response = await http.get(Uri.parse("$API/clients"));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        final clients = jsonList.map((json) => Clients.fromJson(json)).toList();
        return ApiResponse(data: clients, errorMessage: '');
      } else {
        return ApiResponse(data: [], errorMessage: 'an error occured');
      }
    } catch (e) {
      return ApiResponse(errorMessage: 'An error occurred', data: []);
    }
  }

  Future<ApiResponse<List<Clients>>> deleteClient(int clientId) async {
    print("====================== $clientId =====================");
    try {
      final response = await http.delete(Uri.parse("$API/clients/$clientId"));

      if (response.statusCode == 200) {
        final dynamic jsonList = json.decode(response.body);
        final client = jsonList.map((json) => Clients.fromJson(json));
        return ApiResponse(data: client, errorMessage: '');
      } else {
        return ApiResponse(data: [], errorMessage: 'an error occured');
      }
    } catch (e) {
      return ApiResponse(errorMessage: 'An error occurred', data: []);
    }
  }
}
