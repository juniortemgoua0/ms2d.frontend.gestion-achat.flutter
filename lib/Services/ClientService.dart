import 'dart:convert';

import 'package:gestion_achat_front/helper/ApiResponse.dart';
import 'package:gestion_achat_front/models/Client.dart';


class ClientService {
  static const API = '';

  static const ConnectClientAPI = '';

  static const headers = {
    'Content-Type': 'application/json';
    "Accept": 'application/json';

  };

  Future<ApiResponse<dynamic>> createClient(Client client)> async {
    var url = Uri.parse(ConnectClientAPI);

    return http.post(url, headers: headers, body:jsonEncode(client)).then((data)){

      final int statueCode = data.statusCode;

      if(statueCode == 200){
        Map<String, dynamic > jsonData = json.decode(data.body);
        
        
        
        
              }

    };
    return ApiResponse(errorMessage: errorMessage, data: data);

  }
}
