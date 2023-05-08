import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:gestion_achat_front/Services/ClientService.dart';
import 'package:gestion_achat_front/helper/ApiResponse.dart';

import 'package:gestion_achat_front/models/client.dart';

class ListClientPage extends StatefulWidget {
  const ListClientPage({super.key});

  @override
  _ListClientPageState createState() => _ListClientPageState();
}

class _ListClientPageState extends State<ListClientPage> {
  final _clientService = ClientService();
  ApiResponse<List<Clients>> _apiResponse =
      ApiResponse(errorMessage: '', data: []);

  @override
  void initState() {
    super.initState();
    _fetchClients();
  }

  void _fetchClients() async {
    final response = await _clientService.getAllClients();
    setState(() {
      _apiResponse = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients List'),
        backgroundColor: Color(0xFF4B164C),
      ),
      body: ListView.builder(
        itemCount: _apiResponse.data.length,
        itemBuilder: (context, index) {
          final client = _apiResponse.data[index];
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            margin: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    width: 64,
                    height: 64,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(64),
                      color: Colors.amber,
                    ),
                    child: const Icon(
                      Icons.supervised_user_circle,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          client.nom,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45),
                        ),
                        Text(
                          client.login,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                  )
                ]),
                Column(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color(0xFF4B164C),
                            borderRadius: BorderRadius.circular(40)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 24,
                          ),
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Suppression"),
                                content: const Text(
                                    "Êtes vous sur de vouloir supprimer"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      color: Colors.white,
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("okay"),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )),
                  ],
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4B164C),
        onPressed: () {
          Navigator.pushNamed(context, "AddClientPage");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
