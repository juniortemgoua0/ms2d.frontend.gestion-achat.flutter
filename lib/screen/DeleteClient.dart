import 'package:flutter/material.dart';

class DeleteClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Warning'),
      content: const Text('Voulez-vous supprimer ce client?'),
      actions: <Widget>[
        TextButton(
          child: const Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
