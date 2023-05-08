import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gestion_achat_front/Services/ClientService.dart';
import 'package:gestion_achat_front/helper/ApiResponse.dart';
import 'package:gestion_achat_front/models/client.dart';

class AddClientPage extends StatefulWidget {
  const AddClientPage({super.key});

  @override
  State<AddClientPage> createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  String error = "";
  final http = ClientService();
  late ApiResponse<dynamic> _apiResponse;
  late TextEditingController _nomController;
  late TextEditingController _emailController;
  late TextEditingController _loginController;
  late TextEditingController _passwordController;
  late TextEditingController _sexeController;

  String errorMessage = "";
  final List<String> errors = [];
  bool _isObscure = true;

  void addError({var error}) {
    if (!errors.contains(error)) {
      setState(() {
        errorMessage = error;
        errors.add(error);
      });
    }
  }

  void removeError({var error}) {
    if (errors.contains(error)) {
      setState(() {
        errorMessage = "";
        errors.clear();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    errorMessage = "";
    _nomController = TextEditingController();
    _emailController = TextEditingController();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    _sexeController = TextEditingController();
  }

  clearTextField() {
    _nomController.clear();
    _emailController.clear();
    _loginController.clear();
    _passwordController.clear();
    _sexeController.clear();
  }

  saveClient() async {
    ApiResponse<dynamic> response;
    Clients monClient = Clients(
        nom: _nomController.text,
        email: _emailController.text,
        password: _passwordController.text,
        login: _loginController.text,
        sexe: _sexeController.text);

    response = await http.createClient(monClient);
    setState(() {
      if (kDebugMode) {
        print(response);
      }
      _apiResponse = response;
    });
    if (_apiResponse.error == false) {
      setState(() {
        _passwordController.text = "";
        _nomController.text = "";
        _emailController.text = "";
        _sexeController.text = "";
        _loginController.text = "";
      });
    } else {
      setState(() {
        errorMessage = "Veuillez entrer des informations valide !!!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un client'),
        backgroundColor: const Color(0xFF4B164C),
      ),
      body: Form(
          child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    customTextField(
                        controller: _nomController, label: "Entrez le nom"),
                    customTextField(
                        controller: _loginController, label: "Entrez le login"),
                    customTextField(
                        controller: _passwordController,
                        isPassWord: true,
                        label: " Entrez le mot de passe"),
                    customTextField(
                        controller: _emailController,
                        isEmail: true,
                        label: " Entrez email"),
                    customTextField(
                        controller: _sexeController, label: " Entrez le sexe"),
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: saveClient,
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 26),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xFF4B164C)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                "Enregistrer",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    )
                  ]))),
    );
  }

  Container customTextField(
      {required TextEditingController controller,
      required String label,
      bool isPassWord = false,
      bool isEmail = false}) {
    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    controller.text.isEmpty
                        ? Text(
                            errorMessage,
                            style: const TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                color: Colors.red),
                          )
                        : const SizedBox(
                            height: 0,
                          ),
                  ],
                ),
              ),
              TextFormField(
                keyboardType:
                    isEmail ? TextInputType.emailAddress : TextInputType.text,
                obscureText: isPassWord ? _isObscure : false,
                onSaved: (newValue) {
                  setState(() {
                    controller.text = newValue!;
                  });
                },
                onTap: () {
                  if (controller.text.isNotEmpty) {
                    setState(() {
                      errorMessage = "";
                    });
                  } else {
                    setState(() {
                      errorMessage = "Veuillez entrer le mot de passe";
                    });
                  }
                },
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      errorMessage = "";
                    });
                  }
                  if (value.isEmpty) {
                    setState(() {
                      errorMessage = "Veuillez entrer le mot de passe";
                    });
                  }
                },
                validator: (value) {
                  bool? estvide = value?.isEmpty;
                  if (estvide == false) {
                    setState(() {
                      errorMessage = "Veuillez entrer le mot de passe";
                    });
                    return "";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(
                        color: Color(0xFFDD88CF),
                        width: 1,
                        style: BorderStyle.solid),
                  ),

                  //labelText: AppLocalizations.of(context)!.pwd,
                  suffixIcon: isPassWord
                      ? IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        )
                      : null,
                  // hintText: "Nom d'utilisateur",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  filled: true,
                  isDense: true,
                ),
                controller: controller,
              )
            ],
          ),
        ));
  }
}
